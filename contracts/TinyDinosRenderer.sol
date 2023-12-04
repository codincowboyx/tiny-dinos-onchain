// SPDX-License-Identifier: GPL-3.0-or-later

pragma solidity 0.8.23;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./interfaces/ISVGRenderer.sol";

/**
 * @title TinyDinosRenderer
 * @dev Renderers a tiny dino given a hash of the traits. Wrapper around Nouns svg renderer.
 */
abstract contract TinyDinosRenderer is Ownable {

    // TODO

    // prettier-ignore
    // https://creativecommons.org/publicdomain/zero/1.0/legalcode.txt
    bytes32 constant COPYRIGHT_CC0_1_0_UNIVERSAL_LICENSE = 0xa2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499;

    constructor() {

    }
}