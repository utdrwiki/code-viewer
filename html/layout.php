<?php


	function layout_header($title = "deltarune script viewer") {
		return <<<S
<!doctype html>
<head>
	<title>$title</title>
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
	<link rel="stylesheet" href="style.css">
</head>
<body>
S;

	}

	function layout_footer() {
		return <<<S
</body>
</html>
S;
	}

