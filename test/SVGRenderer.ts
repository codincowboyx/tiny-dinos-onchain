import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox/network-helpers";
import { anyValue } from "@nomicfoundation/hardhat-chai-matchers/withArgs";
import { expect } from "chai";
import { ethers } from "hardhat";
import traitsData from "../data/traits-data.json";
import { writeFile } from 'fs';


describe("SVGRenderer", function () {
  async function deployOneYearLockFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await ethers.getSigners();

    const SVGRenderer = await ethers.getContractFactory("SVGRenderer");
    const svgRenderer = await SVGRenderer.deploy();

    return { svgRenderer, owner, otherAccount };
  }

  describe("Render", function () {
    it("Should render part", async function () {
      const { svgRenderer } = await loadFixture(deployOneYearLockFixture);

      const svg = await svgRenderer.generateSVGPart({ image: traitsData.images.body["body-bege-bsod"], palette: `0x${traitsData.palette.join("")}` })


      console.log(svg);
      expect(true).to.equal(true);
    });

    it("Should render svg", async function () {
      const { svgRenderer } = await loadFixture(deployOneYearLockFixture);

      const svg = await svgRenderer.generateSVG({ parts: [{ image: traitsData.images.body["body-bege-bsod"], palette: `0x${traitsData.palette.join("")}` }], background: "111111" })


      writeFile("./test/test.svg", svg, (error) => { console.error(error) })
      expect(true).to.equal(true);
    });
  });
})
