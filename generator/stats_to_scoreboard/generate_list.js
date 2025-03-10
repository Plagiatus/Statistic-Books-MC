//generates the the objectives datalist based on the latest set of available objectives
const baseURL = "https://raw.githubusercontent.com/Ersatz77/mcdata/master/processed/reports/registries/$FOLDER/data.values.txt";

const customFolder = baseURL.replace("$FOLDER", "custom_stat");
const statTypesFolder = baseURL.replace("$FOLDER", "stat_type");
const entitiesFolder = baseURL.replace("$FOLDER", "entity_type");
const itemFolder = baseURL.replace("$FOLDER", "item");
const blockFolder = baseURL.replace("$FOLDER", "block");

let blocks = [];
let items = [];
let entities = [];
let allStats = [];
let statTypes = [];
let customStats = [];

load();

async function load() {
    await loadData();

    const dataList = document.createElement("datalist");
    dataList.id = "objectives";

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
			allStats.push(`minecraft:${type}.minecraft:${element}`);
			allStats.push(`${type}.${element}`);
		}
	}
    dataList.append(...allStats.map((v) => {
        const opt = document.createElement("option");
        opt.innerHTML = v;
        return opt;
    }));
    document.documentElement.appendChild(dataList);
}

async function loadData() {
    customStats.push(...cleanUpRawData(await (await fetch(customFolder)).text()));
    blocks.push(...cleanUpRawData(await (await fetch(blockFolder)).text()));
    items.push(...cleanUpRawData(await (await fetch(itemFolder)).text()));
    entities.push(...cleanUpRawData(await (await fetch(entitiesFolder)).text()));
    statTypes.push(...cleanUpRawData(await (await fetch(statTypesFolder)).text()));
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