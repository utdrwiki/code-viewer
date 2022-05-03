require('dotenv').config();
const algoliasearch = require('algoliasearch');
const {readdir, readFile} = require('fs/promises');

// Algolia limits record size to 100KiB.
// Since JavaScript counts UTF-16 code points instead of bytes, and we also
// put other fields in the record, we limit the code field to 90KB instead.
const CODE_RECORD_SIZE = 90 * 1000;

const DECOMPILED_FOLDER = 'decompiled';

async function main() {
    try {
        // Initialize Algolia client.
        const appId = process.env['ALGOLIA_APP'];
        const appKey = process.env['ALGOLIA_KEY_PRIVATE'];
        if (!appId || !appKey) {
            console.error('Missing required environment variables, exiting.');
            process.exit(1);
        }
        const client = algoliasearch(appId, appKey);
        // Clear all previous objects.
        console.info('Clearing previous objects...');
        const index = client.initIndex('deltarune');
        await index.clearObjects();
        // Get new objects from decompiled files.
        console.info('Rebuilding objects...');
        const objects = [];
        for (const file of await readdir(DECOMPILED_FOLDER)) {
            let fileContents = await readFile(`${DECOMPILED_FOLDER}/${file}`, {
                encoding: 'utf-8'
            });
            let fileIndex = 0;
            while (fileContents.length > 0) {
                // TODO: Make slicing smarter.
                const code = fileContents.slice(0, CODE_RECORD_SIZE);
                const objectID = `${file}_${fileIndex}`;
                objects.push({code, file, objectID});
                fileContents = fileContents.slice(CODE_RECORD_SIZE);
            }
        }
        // Save new objects.
        console.info('Saving new objects...');
        await index.saveObjects(objects);
        // Clean up.
        console.info('Done!');
    } catch (error) {
        console.error('Unhandled error:', error);
    }
}

main();
