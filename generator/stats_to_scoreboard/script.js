const wrapperElement = document.getElementById("wrapper");


createNewInputFieldset();
function createNewInputFieldset() {
    let form = document.createElement("form");
    let fieldset = document.createElement("fieldset");
    fieldset.classList.add("alert", "alert-light");

    // let legend = document.createElement("legend");
    // legend.innerText = "Stats -> Scoreboard";
    // fieldset.appendChild(legend);

    let labelOutput = document.createElement("label");
    labelOutput.innerText = "stat ";
    let inputOutput = document.createElement("input");
    labelOutput.appendChild(inputOutput);
    inputOutput.classList.add("form-control");
    inputOutput.name = "stat";

    let labelObjective = document.createElement("label");
    labelObjective.innerText = "objective ";
    let inputObjective = document.createElement("input");
    labelObjective.appendChild(inputObjective);
    inputObjective.classList.add("form-control");
    inputObjective.name = "objective";

    wrapperElement.appendChild(form);
    form.appendChild(fieldset);
    fieldset.appendChild(labelOutput);
    fieldset.appendChild(labelObjective);
    fieldset.appendChild(document.createElement("span"));
}

document.getElementById("more").addEventListener("click", () => {
    createNewInputFieldset();
});

document.getElementById("function").addEventListener("click", createFunction);
document.getElementById("datapack").addEventListener("click", createDatapack);

async function createFunction() {
    let fileData = await getFunctionText();
    if (!fileData) return;
    let file = new File([fileData], "sync_scores.mcfunction", { type: "text/plain;charset=utf-8" });
    saveAs(file);
}

async function createDatapack() {
    let functionData = await getFunctionText();
    if (!functionData) return;
    const zip = new JSZip();
    const namespace = "sb";

    zip.file(`data/${namespace}/function/sync_scores.mcfunction`, functionData);
    zip.file(`pack.mcmeta`, `{"pack": {"pack_format": 57,"description": ""}}`);

    zip.generateAsync({ type: "blob" }).then(blob => saveAs(blob, "datapack.zip"));
}

async function getFunctionText() {
    let loadedStats = await loadStats();
    if (!loadedStats) return;
    let functionData = "";
    let createScoreboards = !!document.getElementById("createScoreboards").checked;
    for (let form of document.forms) {
        let fieldset = form.querySelector("fieldset");
        fieldset.classList.replace("alert-warning", "alert-light");
        let data = new FormData(form);
        let stat = data.get("stat");
        if (!stat) {
            showError(fieldset, "Empty fields. Not included in the output file.");
            continue;
        };
        let objective = data.get("objective");
        if (!objective) {
            showError(fieldset, "Empty fields. Not included in the output file.");
            continue;
        };

        let [category, target] = stat.split(".");
        if (!category || !target) {
            showError(fieldset, "Invalid stat identifier. Not included in the output file.");
            continue;
        }
        if (createScoreboards) {
            functionData += `scoreboard objectives add ${objective} ${stat.replaceAll(".", ",").replaceAll(":", ".").replaceAll(",", ":")}\n`
        }
        for (let player in loadedStats) {
            functionData += `scoreboard players set ${player} ${objective} ${loadedStats[player][category]?.[target] ?? 0}\n`
        }

        functionData += `\n`;
    }

    return functionData;
}

function showError(parent, error) {
    parent.querySelector("span").innerText = error;
    parent.classList.replace("alert-light", "alert-warning");
}

async function loadStats() {
    let filesInput = document.getElementById("files");
    document.getElementById("files-wrapper").classList.replace("alert-warning", "alert-light");
    if (!filesInput || !filesInput.files || filesInput.files.length === 0) {

        document.getElementById("files-wrapper").classList.replace("alert-light", "alert-warning");
        return;
    }
    let loadedStats = {}
    const reader = new FileReader();
    for (let file of filesInput.files) {
        let name = file.name.split(".")[0];
        let content = JSON.parse(await file.text());
        loadedStats[name] = content.stats;
    }

    return loadedStats;
}

/*
function run() {
    const options = JSON.parse(fs.readFileSync("stats.json", { encoding: "utf-8" }));

    const loadedStats = {};

    // sync stats to scores
    const statsFolder = fs.readdirSync(options.statsFolder);
    for (let file of statsFolder) {
        let fileContent = fs.readFileSync(path.join(options.statsFolder, file), { encoding: "utf-8" });
        let fileData = JSON.parse(fileContent);
        loadedStats[file.split(".")[0]] = fileData.stats;
    }

    let functionFileContent = "";
    for (let stat of (options.stats ?? [])) {
        let [category, target] = stat.stat.split(".");
        for(let player in loadedStats){
            functionFileContent+=`scoreboard players set ${player} ${stat.objective} ${loadedStats[player][category][target] ?? 0}\n`
        }
    }

    fs.writeFileSync("sync_scores.mcfunction", functionFileContent);
}
*/