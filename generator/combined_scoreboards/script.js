const wrapperElement = document.getElementById("wrapper");

createNewInputFieldset();
function createNewInputFieldset() {
    let form = document.createElement("form");
    let fieldset = document.createElement("fieldset");

    let fieldsetInputs = document.createElement("fieldset");
    let legend = document.createElement("legend");
    legend.innerText = "Input Objectives";
    fieldsetInputs.appendChild(legend);
    addInputField(fieldsetInputs);

    let labelOutput = document.createElement("label");
    labelOutput.innerText = "Output ";
    let inputOutput = document.createElement("input");
    labelOutput.appendChild(inputOutput);
    inputOutput.classList.add("form-control");
    inputOutput.name = "output";

    wrapperElement.appendChild(form);
    form.appendChild(fieldset);
    fieldset.appendChild(fieldsetInputs);
    fieldset.appendChild(labelOutput);
}

function addInputField(_parent) {
    let input = document.createElement("input");
    input.name = "input";
    input.classList.add("form-control");
    _parent.appendChild(input);
    input.addEventListener("blur", () => {
        for (let child of _parent.children) {
            if (child instanceof HTMLInputElement && !child.value) return;
        }
        addInputField(_parent);
    })
}

document.getElementById("more").addEventListener("click", () => {
    createNewInputFieldset();
});

document.getElementById("function").addEventListener("click", createFunction);
document.getElementById("datapack").addEventListener("click", createDatapack);

function createFunction() {
    let file = new File([getFunctionText()], "test.txt", { type: "text/plain;charset=utf-8" });
    saveAs(file);
}

function getFunctionText() {
    let functionData = "";
    for (let form of document.forms) {
        let data = new FormData(form);
        let output = data.get("output");
        if (!output) continue;

        let inputs = [];
        data.getAll("input").forEach((d) => { if (d) inputs.push(d) });
        if (inputs.length == 0) continue;

        functionData += `scoreboard objectives add ${output} dummy\n`;
        functionData += `scoreboard players set @s ${output} 0\n`;
        for (let input of inputs) {
            functionData += `scoreboard players operation @s ${output} += @s ${input}\n`;
        }
        functionData += `\n`;
    }

    return functionData;
}

function createDatapack() {
    let functionData = getFunctionText();
    const zip = new JSZip();
    const namespace = (Math.random() + 1).toString(36).substring(7).toLocaleLowerCase();

    zip.file(`data/${namespace}/function/combine_scores.mcfunction`, functionData);
    zip.file(`data/sb/tags/function/run_before.json`, `{"values":["${namespace}:combine_scores"]}`);
    zip.file(`pack.mcmeta`, `{"pack": {"pack_format": 57,"description": ""}}`);

    zip.generateAsync({ type: "blob" }).then(blob => saveAs(blob, "datapack.zip"));
}

/*
function run() {
    const objectivesData = JSON.parse(fs.readFileSync("objectives.json", { encoding: "utf-8" }));

    let functionData = "";
    for (let obj of objectivesData.objectives) {
        if (!obj.inputs || obj.inputs.length == 0) {
            console.warn("Objective invalid. Needs inputs. Ignoring.", obj);
            continue;
        }
        if (!obj.output && typeof obj.output !== String || obj.output.length === 0) {
            console.warn("Objective invalid. Needs non-empty string as output. Ignoring.", obj);
            continue;
        }
        functionData += `scoreboard objectives add ${obj.output} dummy\n`;
        functionData += `scoreboard players set @s ${obj.output} 0\n`;
        for (let input of obj.inputs) {
            if (!typeof input === String || input.length === 0) {
                console.warn("Objective invalid. Input needs to be a (non-empty) string. Ignoring.", input);
                continue;
            }
            functionData += `scoreboard players operation @s ${obj.output} += @s ${input}\n`;
        }
        functionData += `\n`;
    }


    fs.writeFileSync("combine_scores.mcfunction", functionData);
}*/