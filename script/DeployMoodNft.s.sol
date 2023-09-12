//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory sadSVG = vm.readFile("./img/sad.svg");
        string memory happySVG = vm.readFile("./img/happy.svg");
        console.log("happySVG", happySVG);
        console.log("sadSVG", sadSVG);

        vm.startBroadcast();
        MoodNft moodNft = new MoodNft(
            svgToImagineURI(sadSVG),
            svgToImagineURI(happySVG)
        );
        vm.stopBroadcast();
        return moodNft;
    }

    function svgToImagineURI(
        string memory _svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";
        //converting to string then to bytes then encoding it
        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(_svg)))
        );
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}
