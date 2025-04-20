//generates the sb:setup_objectives file based on the latest set of available objectives
// const baseURL = "https://raw.githubusercontent.com/Ersatz77/mcdata/master/processed/reports/registries/$FOLDER/data.values.txt";
const baseURL = "https://raw.githubusercontent.com/Ersatz77/mcdata/refs/tags/1.21.5/processed/reports/registries/$FOLDER/data.values.txt";

const customFolder = baseURL.replace("$FOLDER", "custom_stat");
const statTypesFolder = baseURL.replace("$FOLDER", "stat_type");
const entitiesFolder = baseURL.replace("$FOLDER", "entity_type");
const itemFolder = baseURL.replace("$FOLDER", "item");
const blockFolder = baseURL.replace("$FOLDER", "block");

const fs = require("fs");
const https = require("https");

let blocks = [];
let items = [];
let entities = [];
let allStats = [];
let statTypes = [];
let customStats = [];

run();

async function run() {
	await getData();
	for (let type of statTypes) {
		let elementsToAdd = [];
		switch (type) {
			case "custom":
				elementsToAdd = customStats;
				break;
			case "killed":
			case "killed_by":
				elementsToAdd = entities;
				break;
			case "mined":
				elementsToAdd = blocks;
				break;
			case "broken":
			case "crafted":
			case "dropped":
			case "picked_up":
			case "used":
				elementsToAdd = items;
				break;
			default:
				console.error(`WARNING: UNKNOWN OBJECTIVE TYPE: ${type}\n\tWas there a change in statistic names?`);
				continue;
		}
		for (let element of elementsToAdd) {
			allStats.push(type + ":" + element);
		}
	}

	let functionFileContent = "### AUTOMATICALLY GENERATED!\n### DO NOT EDIT MANUALLY!\n\n";
	for (let stat of allStats) {
		functionFileContent += `scoreboard objectives add sb.${stat.replace(":", ".")} ${stat}\n`;
	}
	fs.writeFileSync("../data/sb/function/setup_objectives.mcfunction", functionFileContent);
}
async function getData() {
	customStats.push(...cleanUpRawData(await getAsync(customFolder)));
	blocks.push(...cleanUpRawData(await getAsync(blockFolder)));
	items.push(...cleanUpRawData(await getAsync(itemFolder)));
	entities.push(...cleanUpRawData(await getAsync(entitiesFolder)));
	statTypes.push(...cleanUpRawData(await getAsync(statTypesFolder)));
}

function cleanUpRawData(input) {
	let result = [];
	let split = input.split("\n");
	for (let s of split) {
		result.push(trimMinecraftNamespace(s));
	}
	return result;
}
function trimMinecraftNamespace(input) {
	if (input.startsWith("minecraft") && input.length > 10) {
		input = input.substring(10);
	}
	return input;
}

async function getAsync(url) {
	return new Promise((resolve, reject) => {
		https.get(url, response => {
			let body = "";
			response.on("data", chunk => {
				body += chunk;
			});
			response.on("end", () => {
				resolve(body);
			});
			response.on("error", reject);
		})
	})
}