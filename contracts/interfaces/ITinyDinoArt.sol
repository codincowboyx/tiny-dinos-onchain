// SPDX-License-Identifier: GPL-3.0

/// @title Interface for Tiny Dino art

pragma solidity 0.8.23;

interface ITinyDinoArt {
    error SenderIsNotDescriptor();

    error EmptyPalette();

    error BadPaletteLength();

    error EmptyBytes();

    error BadDecompressedLength();

    error BadImageCount();

    error ImageNotFound();

    error PaletteNotFound();

    event BackgroundsAdded(uint256 count);

    event PaletteSet(uint8 paletteIndex);

    event BodiesAdded(uint16 count);

    event ChestsAdded(uint16 count);

    event EyesAdded(uint16 count);
    
    event FacesAdded(uint16 count);

    event FeetAdded(uint16 count);

    event HandsAdded(uint16 count);

    event HeadsAdded(uint16 count);

    event SpikesAdded(uint16 count);

    struct Seed {
        uint16 oneofone;
        uint16 background;
        uint16 body;
        uint16 chest;
        uint16 eyes;
        uint16 face;
        uint16 feet;
        uint16 hands;
        uint16 head;
        uint16 spikes;
    }

    // struct Trait {
    //     NounArtStoragePage[] storagePages;
    //     uint256 storedImagesCount;
    // }

    function descriptor() external view returns (address);

    function setDescriptor(address descriptor) external;

    // function setInflator(IInflator inflator) external;

    function addManyBackgrounds(string[] calldata _backgrounds) external;

    function addBackground(string calldata _background) external;

    function palettes(uint8 paletteIndex) external view returns (bytes memory);

    function setPalette(uint8 paletteIndex, bytes calldata palette) external;

    function addBodies(
        bytes calldata encodedCompressed,
        uint80 decompressedLength,
        uint16 imageCount
    ) external;

    function addAccessories(
        bytes calldata encodedCompressed,
        uint80 decompressedLength,
        uint16 imageCount
    ) external;

    function addHeads(
        bytes calldata encodedCompressed,
        uint80 decompressedLength,
        uint16 imageCount
    ) external;

    function addGlasses(
        bytes calldata encodedCompressed,
        uint80 decompressedLength,
        uint16 imageCount
    ) external;

    function addBodiesFromPointer(
        address pointer,
        uint80 decompressedLength,
        uint16 imageCount
    ) external;

    function setPalettePointer(uint8 paletteIndex, address pointer) external;

    function backgroundCount() external view returns (uint256);

    function bodyCount() external view returns (uint256);

    function accessoryCount() external view returns (uint256);

    function headCount() external view returns (uint256);

    function glassesCount() external view returns (uint256);

    function backgrounds(uint256 index) external view returns (string memory);

    function heads(uint256 index) external view returns (bytes memory);

    function bodies(uint256 index) external view returns (bytes memory);

    function accessories(uint256 index) external view returns (bytes memory);

    function glasses(uint256 index) external view returns (bytes memory);

    // function getBodiesTrait() external view returns (Trait memory);

    // function getAccessoriesTrait() external view returns (Trait memory);

    // function getHeadsTrait() external view returns (Trait memory);

    // function getGlassesTrait() external view returns (Trait memory);
}