# tiny-dinos-onchain
onchain tiny dinos

## Inspiration

* Nouns DAO v2 Descriptor contract: https://etherscan.deth.net/address/0x25fF2FdE7df1A433E09749C952f7e09aD3C27951

* Nouns DAO SVG renderer contract: https://etherscan.deth.net/address/0x81d94554A4b072BFcd850205f0c79e97c92aab56

## TODO

1) Optimize SVGRenderer.sol for 16x16 grid as the packing will be inefficient otherwise. i.e. less rows needing to pack
2) Compile all dino traits and pallette into `./data/traits-data.json`
3) Update Tiny Dinos renderer, ITinyDinoArt and figure out storage for traits

## Local Setup

1) Install Node/Npm
2) `npm install`
3) `npm install -g ts-node`

## Scripts

### Test Trait Rendering

Hardhat Test:
1) update `./test/SVGRenderer.ts`
2) run `npx hardhat test`

JS renderer (ignore):
1) Open ./scripts/encodingToSvg.ts
2) Change TRAIT value to the key in the `./data/traits-data.json` file of the images field
3) Change TRAIT_VAL value to the key in the `./data/traits-data.json` file of the trait field
4) Run `ts-node ./scripts/encodingToSvg.ts`
