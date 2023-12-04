import traitsData from "../data/traits-data.json";

// encoding: Palette Index, Bounds [Top (Y), Right (X), Bottom (Y), Left (X)] (4 Bytes), [Pixel Length (1 Byte), Color Index (1 Byte)][]
// ex: // ex: 0x0015171f093a0101000d0101000d0101000d0101000d0101000d0101000d0101000b01
// pallette idx: 0x01
// bounds: [top: 0x0b, right: 0x00, bottom: 0x01, left: 0x01]
// rects: [0x0d, 0x00] [0x01, 0x01], [0x0d, 0x00], etc.

const TRAIT = "body";
const TRAIT_VAL = "body-bege-bsod";

interface Rect {
    length: number;
    colorIndex: number;
}

const getByteToNum = (index: number, val: string) => {
    const idxStart = val.length - ((index + 1) * 2); // solidity reads memory from right to left
    console.log(val.length, idxStart)
    console.log(`0x${val.substring(idxStart, idxStart + 2)}`)
    return Number(`0x${val.substring(idxStart, idxStart + 2)}`);
}

const svgRect = (rekt: Rect, x: number, y: number): string => {
    // NOTE: height should be changed for dino traits to optimize
    return `<rect width="${rekt.length}" height="10" x="${x}" y="${y}" fill="#${traitsData.palette[rekt.colorIndex]}" />`;
}

const run = () => {
    let encodedTrait: string = traitsData.images[TRAIT][TRAIT_VAL];
    encodedTrait = encodedTrait.replace("0x", "");

    const palletteIdx = getByteToNum(0, encodedTrait);
    const top = getByteToNum(1, encodedTrait);
    const right = getByteToNum(2, encodedTrait);
    const bottom = getByteToNum(3, encodedTrait);
    const left = getByteToNum(4, encodedTrait);

    const rects = [];
    for (let i = 5; i < encodedTrait.length; i += 2) {
        rects.push({length: getByteToNum(i, encodedTrait), colorIndex: getByteToNum(i + 1, encodedTrait)})
    }
    
    
}
 
(() => {
    run();
})();