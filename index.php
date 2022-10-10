<!doctype html>
<head>
        <title>deltarune script viewer</title>
        <!--
        oh, hey.

        ... you're looking for secrets in a place designed to
        help people look for secrets?

        ok, i guess. i don't really get why, but, cool!
        i bet nobody will see this message.

        though if you're reading this, that means
        there's one person:
                                                                 you.

        thanks for stopping by. <3

        -->
        <link rel="stylesheet" href="style.css" />
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta name="robots" content="none" />
</head>
<body>
<div id="yrstruly">
	<em>this is the <strong><del>deltarune</del> <del>undertalemodtool</del> deltarune script viewer</strong></em>
	<br>by <a href="https://twitter.com/xkeepah">xkeeper</a>
	<br>ported for personal use on Windows by <a href="https://github.com/Grossley">Grossley</a>
	<br>updated for chapter 2 decompilation by <a href="https://github.com/Jacky720">Jacky720</a>
	<br>made into a static website by <a href="https://kocka.tech">KockaAdmiralac</a>.
	<br>source on <a href="https://github.com/KockaAdmiralac/deltarune-viewer">github</a>
	<br>links: <a href="https://www.reddit.com/r/Underminers/">r/underminers</a>, <a href="https://tcrf.net/Deltarune">tcrf</a>, <a href="https://deltarune.fandom.com">wiki</a>
</div>

<h1>decompiled <del>deltarune</del> <del>undertalemodtool</del> deltarune script viewer</h1>
<?php
	if (v($argv[1])) {
		$_GET['f']	= $argv[1];
	}
	
	if (isset($_GET['f'])) {
?>
	<strong><a href="..">&larr; back to main script listing</a></strong><br>
<?php
	}
?>
	(etc: <a href="data/enemy.txt">enemy ids</a> - <a href="data/rooms.txt">room list</a> - <a href="data/flags.txt">flag names</a>)
<?php

	error_reporting(E_ALL);

	$secondLevelR	= 0;


	if (!isset($_GET['f'])) {
		$algolia_key = isset($_SERVER['ALGOLIA_KEY_PUBLIC']) ? $_SERVER['ALGOLIA_KEY_PUBLIC'] : false;
		$algolia_app = isset($_SERVER['ALGOLIA_APP']) ? $_SERVER['ALGOLIA_APP'] : false;
		if ($algolia_key && $algolia_app) {
?>
	<form method="GET" id="search-form">
		<label for="search">search:</label>
		<input type="text" name="search" size="20"></input>
		<input type="hidden" name="key" value="<?php echo $algolia_key; ?>"></input>
		<input type="hidden" name="app" value="<?php echo $algolia_app; ?>"></input>
		<input type="submit" value="go"></input>
	</form>
	<section class="hidden" id="search-results">
		<h2>search results</h2>
		<ul id="search-list"></ul>
	</section>
	<script src="algoliasearch-lite.umd.js"></script>
	<script src="search.js"></script>
<?php
		}
?>
	<h2>script listing</h2>
<?php
		$a = scandir("./decompiled/");
		$lastseg = "";
		$junksums = getJunkSums();
		$junkfiles = [];

		foreach ($a as $file) {
			if (substr($file, -4) !== ".gml") {
				continue;
			}
			$filename = "decompiled/$file";
			$size = filesize($filename);
			$class = "";
			$sum = hash_file("sha256", $filename);
			if (isset($junksums[$sum])) {
				$class	= " class='junk'";
			}
			$replaced = str_replace(".gml", ".html", $file);
			$temp = sprintf("<pre><a href='/%s'%s>%-60s</a>  %10d</pre>", $replaced, $class, $file, $size);

			if ($class === "") {
				$segs	= explode("_", $file);
				array_pop($segs);
				array_pop($segs);
				$seg	= implode("_", $segs);
				if ($seg !== $lastseg) {
					print "<br>";
					$lastseg	= $seg;
				}
				print $temp;
			} else {
				$junkfiles[$sum][] = $temp;
			}
		}

		print "\n========================================================================\nduplicated or common scripts<br>";

 		foreach ($junksums as $junksum => $junkdesc) {
			print "\n------------------------------------------------------------------------\n$junkdesc\n";
			print implode("", $junkfiles[$junksum]);
		}
	} else {


		$f	= $_GET['f'];
		if (stripos($f, "/") !== false) {
			echo "No.";

		} elseif (!file_exists("decompiled/". $f)) {
			echo "File not found (or other unexpected error, what are you doing???)";

		} else {


			$file		= mangleFile($f);


			print "<h2>$f</h2><small>(<a href='https://github.com/KockaAdmiralac/deltarune-viewer/blob/master/decompiled/$f'>view raw script w/o annotations or w/e</a>)</small><hr>";
			//print "option: <a href='/". $_GET['f'] ."&amp;x=1'>disable with(...){...} collapsing</a>\n-----------------------------------------\n\n";

			$lines = explode("\n", $file);
			$line_index = 1;
			echo '<table class="code">';
			foreach ($lines as $line) {
				echo "\n<tr>\n\t<td id=\"L$line_index\"><a href=\"#L$line_index\">$line_index</a></td>\n\t<td><pre>$line</pre></td>\n</tr>";
				$line_index++;
			}
			echo "</table><script src=\"script.js\"></script>";
		}

	}



	function mangleFile($filename, $secondLevel = 0, $sizeLimit = null) {
		static $mangled	= array();
		global $secondLevelR, $baseFile, $fullFile;

		$oldBaseFile	= $baseFile;
		$oldFullFile	= $fullFile;

		$segs			= explode("_", $filename);
		array_pop($segs);
		array_pop($segs);
		$baseFile		= implode("_", $segs);
		$fullFile		= $filename;

		$oldSL			= $secondLevelR;
		$secondLevelR	= $secondLevel;

		if (isset($mangled[$filename])) {
			$secondLevelR	= $oldSL;
			$baseFile		= $oldBaseFile;
			$fullFile		= $oldFullFile;
			//print "$secondLevelR - $secondLevel Q $oldSL\n";
			return $mangled[$filename];
		}
		//print "$secondLevelR - $secondLevel M $oldSL\n";


		$filename2	= "decompiled/". $filename;
		if (!file_exists($filename2)) {
			return "something went wrong here.\n$filename";
			//die("SOMETHING HAS GONE HORRIBLY WRONG!!!\nOH NO!!!\n$filename2\n");
		}
		$file	= file_get_contents($filename2);

		if ($sizeLimit && strlen($file) > $sizeLimit) {
			$replaced = str_replace(".gml", ".html", $filename);
			$file	= "too big to show inline, sorry\n\n<a href='/$replaced'>view full file</a>";
			$mangled[$filename]	= $file;

			return $file;
		}

		$file	= str_replace("\r\n", "\n", $file);
		$file	= preg_replace('/^\s+$/m', '', $file);
		$file	= preg_replace('/\n\s*{$/m', ' {', $file);

		//$file	= preg_replace_callback('/(scr_84_get_lang_string\(")([a-zA-Z0-9_-]+)("[@0-9A-F]+\))/mi', "textvar_to_text", $file);
		$file	= preg_replace_callback('/(stringsetloc\(")((?:[^"\\\\]|\\\\.)+)(", "[a-z0-9_-]+"\))/mi', "textvar_to_text", $file);
		// TODO: Actually make this regex more efficient instead of bypassing the PCRE JIT stack limit
		$jit_old = ini_get('pcre.jit');
		ini_set('pcre.jit', '0');
		$file	= preg_replace_callback('/(?<=[( ])(")((?:[^"\\\\]|\\\\.)+)(", "[a-z0-9_-]+")/mi', "textvar_to_text", $file);
		ini_set('pcre.jit', $jit_old);
		$file	= preg_replace_callback('/(scr_84_get_lang_string_ch1\(")([a-zA-Z0-9_-]+)(")\)/mi', "textvar_to_text_ch1", $file);
		$file	= preg_replace_callback('/(global\.flag\[)([0-9]+)(\])/mi', 'flagcolor', $file);
		$file	= preg_replace_callback('/(keyboard_check(?:_pressed)?\()([0-9]+)(\))/im', 'keyboard', $file);
		$file	= preg_replace_callback('/(keyboard_check(?:_pressed)?\()(\'.\'|[0-9]+|vk_[^)]+)(\))/im', 'keyboard', $file);
		$file	= preg_replace_callback('/_temp_local_var_([0-9]+)/im', 'tempvar', $file);
		//$file	= preg_replace('/scr_debug/i', '<span class="debug">scr_debug</span>', $file);
		$file	= preg_replace_callback('/(self\.room\s*[!=]+\s*|room_goto\()([A-Za-z0-9_]+)/mi', 'roomlist', $file);
		$file	= preg_replace_callback('/(global\.monstertype\b.*[!=]+\s*)([0-9]+)/mi', 'enemylist', $file);

		#if (!$secondLevel) {
			$file = preg_replace_callback('/(\b)(s?cr?_[a-zA-Z0-9_]+)\(/mi', 'functionlink', $file);
		#}

		//$file	= preg_replace_callback('/^[ \t]+/m', "unindent", $file);
		if (!v($_GET['x'])) {
			//$file	= withhandler($file);
		}

		#if (!$secondLevel) {
			$file = preg_replace_callback('/(<div>|^)( *.+)(alarm\[([0-9]+)\])( = .*$)/m', 'alarmer', $file);
		#}

		$mangled[$filename]	= $file;


		$secondLevelR	= $oldSL;
		$baseFile		= $oldBaseFile;
		$fullFile		= $oldFullFile;

		return $file;
	}


	function functionlink($matches) {
		global $secondLevelR;
		$filename	= "gml_GlobalScript_". $matches[2] .".gml";
		$sc			= ($matches[2] == "scr_debug") ? " debug" : "";

		$replaced = str_replace(".gml", ".html", $filename);
		if ($secondLevelR) {
			return "$matches[1]<span class='funcC'><a class='func$sc' href='/$replaced'>$matches[2]</a></span>(";

		} else {
			return "$matches[1]<span class='funcC'><a class='func$sc' href='/$replaced'>$matches[2]</a><div class='funcCode'><strong><a href='/$replaced'>$matches[2]</a></strong><br><br>". str_replace("\n", "<br>", mangleFile($filename, true, 3000)) ."</div></span>(";
		}
	}


	function alarmer($matches) {
		global $fullFile, $baseFile, $secondLevelR;
		static $hackCount;

		$line	= trim(strip_tags($matches[0]));

		if (strpos($line, "if (")) {
			// abort if this is an if condition or other wonky thing
			return $matches[0];
		}

		$objT	= explode("=", $line);
		$obj	= explode(".", $objT[0]);
		$objN	= $obj[0];

		$objN = $baseFile; // sorry xkeeper
		if (count($obj) === 2 && $objN === "self") { // dunno how this is supposed to work but I'll just let it do its non-working thing.
			$objN	= $baseFile;
		} elseif (count($obj) == 2) {
			$objN	= "gml_Object_". $objN;
		} else {
			$out	= "<div class='alarmT'><strong>(unknown reference)</strong>\n\nyou're on your own, sorry.\ncheck for 'instance_create' nearby.</div>";
			//return $matches[1] . "<span class='alarmC'><span class='alarmU'>" . $matches[2] ."<span class='alarm'>". $matches[3] ."</span>". $matches[5] ."</span><span class='alarmA'></span>". $out ."</span><span class='c'></span>";
		}

		$objF	= "{$objN}_Alarm_$matches[4].gml";

		if ($objF == $fullFile) {
			$out	= "err, wait, that's THIS file.\n\nrecursion sure is neat, huh?";

		} elseif ($secondLevelR) {
			$out	= "You probably shouldn't ever see this!\n\nIf you are seeing it that's weird";

		} else {
			$out	= "". mangleFile($objF, true, 3000) ."";
		}

		$replaced = str_replace(".gml", ".html", $objF);
		$out	= "<div class='alarmT'><strong><a href='/$replaced'>". str_replace("gml_Object_", "", $objF) ."</a></strong>\n\n". $out ."</div>";

		$override	= false;
		if ($objF == $fullFile && $hackCount > 1) {
			// special hack for this horrible file full of alarms
			$override	= true;
		}


		if (!$secondLevelR) $hackCount++;

		if ($secondLevelR || $override) {
			return $matches[1] . "" . $matches[2] ."<a class='alarm' href='/$replaced' title='$objF'>". $matches[3] ."</a>". $matches[5] ."";

		} else {
			return $matches[1] . "<span class='alarmC'><span class='alarmU'>" . $matches[2] ."<a href='/$replaced' title='$objF' class='alarm'>". $matches[3] ."</a>". $matches[5] ."</span><span class='alarmA'></span>". $out ."</span><span class='c'></span>";
		}

	}



	function withhandler($matches) {

		if (is_array($matches)) {
			$text		= $matches[5];
			$replace	= $matches[3];
		} else {
			$text		= $matches;
			$replace	= false;
		}

		$newtext		= preg_replace_callback('/^( *)(with \()([^\)]+)(\)\s+{)(.*?)(^\1})/mis', 'withhandler', $text);

		if ($replace !== false) {
			$colorv		= mt_rand(0, 359);
			$colorv		= abs(crc32($replace)) % 360;
			$color		= "<span class='withkey' style='color: hsl(". $colorv .", 70%, 70%)'>";
			$color2		= "style='background: hsl(". $colorv .", 50%, 5%); border-color: hsl(". $colorv .", 20%, 20%)'";

			$newtext	= preg_replace('/^    /m', '', $newtext);
			$newtext	= preg_replace('/([^][])self\./', '$1'. $color . $replace .'</span>.', $newtext);
			$newtext	= preg_replace('/^(\s+)([A-Za-z0-9_]+)(\(.*?\))$/m', '$1'. $color . $replace .'</span>.$2$3', $newtext);

			//$newtext	= "<div class='with' $color2 title='with(". encode2($replace) .") { ... }'>". trim($newtext, "\n") ."</div>";
			$newtext	= "<div class='with' $color2 title='with(". encode2($replace) .") { ... }'><div>". $newtext ."</div></div>";
		} else {
			$newtext	= preg_replace("/<div>\n+/", '<div>', $newtext);
		}

		return $newtext;

	}


	function encode2($str) {
		//$str = mb_convert_encoding($str , 'UTF-32', 'UTF-8');
		$t = unpack("C*", $str);
		$t = array_map(function($n) { return "&#$n;"; }, $t);
		return implode("", $t);
	}


	function keyboard($matches) {
		if (is_numeric($matches[2])) {
			$k	= intval($matches[2]);
			$kc	= chr($k);
			if ($k < 32) { $kc = "(unk)"; }
			return $matches[1] .$matches[2] ." <span class='kbd'>\"$kc\"</span>". $matches[3];

		} else {
			return "<span class='kbd'>$matches[1]<span>$matches[2]</span>$matches[3]</span>";

		}
	}

	function tempvar($matches) {
		$t	= intval($matches[1]);
		return "<span class='tempvar' style='color: hsl(". (($t * 80) % 360) .", 80%, 80%);'>temp_$t</span>";
	}


	function unindent($matches) {
		$max	= 40;

		$m	= strlen($matches[0]);
		$ct	= $m / 4;
		$c	= $ct * 32;
		if ($ct > $max) {
			$c	= $max * 32;
			$h	= ($ct - $max) * 2;
			return "<span class='indent' style='width: {$c}px;' title='$ct levels'></span><span class='indent-hyper' style='width: {$h}px;' title='oof'></span>";
		}

		return "<span class='indent' style='width: {$c}px;' title='$ct levels'></span>";
	}


	function flagcolor($matches) {
		global $flags;
		$flagt	= $matches[2];
		$flag	= D_Flags::getId($matches[2]);
		if ($flag) {
			$flagt	= "<span class='flagn'>$matches[2] <span class='flagd'>". $flag ."</span></span>";
		}
		return "<span class='flag'>$matches[1]$flagt$matches[3]</span>";
	}

	function roomlist($matches) {

		$roomtext	= $matches[2];
		$roomalt	= null;
		$roomdesc	= null;
/*
		if (is_numeric($matches)) {
			$room		= D_Rooms::getId($matches[2]);
			if ($room) {
				$roomtext	= $matches[2];
				$roomalt	= $room['name'];
				$roomdesc	= $room['desc'];
			}
		} else {
			$room		= D_Rooms::getName($matches[2]);
			if ($room) {
				$roomtext	= $matches[2];
				$roomalt	= $room['id'];
				$roomdesc	= $room['desc'];
			}
		}

		if ($roomalt === null) {
			return $matches[0];
		}

		return $matches[1] ."<span class='room'>$roomalt $roomtext <span class='roomdesc'>$roomdesc</span></span>";
*/
		return $matches[1] ."<span class='room'>$roomtext</span>";
	}


	function enemylist($matches) {
		$enemyname	= D_Enemies::getId(intval($matches[2]));
		return $matches[1] . $matches[2] ." <span class='room'>$enemyname</span>";
	}



	function textvar_to_text($matches) {
		//global $lang;
		//var_dump($lang);
		//var_dump($matches);
		//die();
		$text	= $matches[2];
		if ($text) {
			//return $matches[1] .
			//	"<span class='langvar'>$matches[2]</span>$matches[3] ".
			//	"<span class='langtext'>". $lang[$matches[2]] ."</span>";
			return //$matches[1] .
				"<div class='langtext'><span>". D_Lang::parseText($text) . "</span>".
				"<div class='langvar'>". $matches[1] . $matches[2] . $matches[3] ."</div>" .
				"</div>" .
				""; //$matches[3];
		} else {
			return $matches[1] .
					"<span class='langvar'>$matches[2]<span>$matches[3]".
					"<span class='langtexterror'>(MISSING)</span>";
		}
	}



	function textvar_to_text_ch1($matches) {
		$text	= D_Lang::getText($matches[2]);
		if ($text) {
			return  "<div class='langtext'><span>". D_Lang::parseText($text) . "</span>".
				"<div class='langvar'>". $matches[1] . $matches[2] . $matches[3] ."</div>" .
				"</div>";
		} else {
			return $matches[1] .
					"<span class='langvar'>$matches[2]<span>$matches[3]".
					"<span class='langtexterror'>(MISSING)</span>";
		}
	}


	class D_Lang {
		protected static $lang = null;

		protected static function init() {
			$lang	= json_decode(file_get_contents("data/lang_en.json"), true);
			self::$lang	= $lang;
		}

		public static function getText($key) {
			if (self::$lang === null) self::init();
			return v(self::$lang[$key]);
		}

		public static function parseText($text) {
			$text	= preg_replace('#(?<!`)/#i', '<span class="cc cc-wait">Wait for input</span>', $text);
			$text	= preg_replace('#\^([1-9])(.)#i', '\2<span class="cc cc-delay">Delay \1<span>\1</span></span>', $text);
			$text	= preg_replace('#(?<!`)&	?#i', '<br>', $text);
			$text	= preg_replace('#(?<!`)%#i', '<span class="cc cc-close">Close Message</span>', $text);
			$text	= preg_replace('#\\\\\\\\[EM](.)#', '<span class="cc-face">Face \1</span>', $text);
			$text	= preg_replace('#\\\\\\\\m(.)	+\*?#', '<span class="cc-face">Mini face \1</span> ', $text);
			$text	= preg_replace('#\\\\\\\\f(.)	+\*?#', '<span class="cc-face">Mini text \1</span> ', $text);
			#$text	= preg_replace('#\\\\\\\\c(.)#', '(color: \1)', $text);
			$text	= preg_replace('#\\\\\\\\c(.)(.*?)(?=\\\\\\\\c|$)#', '<span class="cc-color cc-\1">\2</span>', $text);
			$text	= preg_replace('#\\\\\\\\T(.)#', '<span class="cc-face">Sound \1</span>', $text);
			$text	= preg_replace('#\\\\\\\\F(.)#', '<span class="cc-face">Char \1</span>', $text);
			$text	= preg_replace('#\\\\\\\\C(.)#', '<span class="cc-face">Choice type \1</span>', $text);
			$text   = preg_replace('#\\\\"#', '"', $text);
			$text   = preg_replace('#`(.)#', '\1', $text);
			return $text;
		}

	}

	class D_Rooms {
		protected static $rooms = null;

		protected static function init() {
			$roomA	= explode("\n", file_get_contents("data/rooms.txt"));
			$rooms	= array('id' => array(), 'name' => array());
			foreach ($roomA as $room) {
				if (!trim($room)) continue;
				$roomT	= explode("\t", $room);
				$rooms['id'][$roomT[0]] = array('name' => $roomT[1], 'desc' => $roomT[2]);
				$rooms['name'][$roomT[1]]	= array('id' => $roomT[0], 'desc' => $roomT[2]);
			}
			self::$rooms	= $rooms;
		}

		public static function getName($name) {
			if (self::$rooms === null) self::init();
			return v(self::$rooms['name'][$name]);
		}

		public static function getId($id) {
			if (self::$rooms === null) self::init();
			return v(self::$rooms['id'][$id]);
		}
	}

	class D_Enemies {
		protected static $enemies = null;

		protected static function init() {
			$enemiesA	= explode("\n", file_get_contents("data/enemy.txt"));
			$enemies	= array();
			foreach ($enemiesA as $enemy) {
				if (!trim($enemy)) continue;
				$enemy	= explode("\t", $enemy);
				$enemies[$enemy[0]]	= $enemy[1];
			}
			self::$enemies	= $enemies;

		}

		public static function getId($id) {
			if (self::$enemies === null) self::init();
			return v(self::$enemies[$id], "(UNKNOWN ENEMY $id)");
		}
	}


	class D_Flags {
		protected static $flags = null;

		protected static function init() {
			$flagsA		= explode("\n", file_get_contents("data/flags.txt"));
			$flags		= array();
			foreach ($flagsA as $flag) {
				if (!trim($flag)) continue;
				$flagZ	= explode("\t", $flag);
				$flags[$flagZ[0]]	= trim($flagZ[1]);
			}
			self::$flags	= $flags;

		}

		public static function getId($id) {
			if (self::$flags === null) self::init();
			return v(self::$flags[$id]);
		}
	}


	function getJunkSums() {
		$junksums = [];
		foreach (explode("\n", file_get_contents("data/sums.yml")) as $line) {
			$parts = explode(": ", $line);
			if (count($parts) !== 2) {
				continue;
			}
			$junksums[$parts[0]] = $parts[1];
		}
		return $junksums;
	}


	function v(&$var, $d = null) {
		return isset($var) ? $var : $d;
	}


?>
</body>
</html>
