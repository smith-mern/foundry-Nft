//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";
import {Test, console} from "forge-std/Test.sol";

contract DeployMoodNftTest is Test {
    DeployMoodNft public deployer;

    function setUp() public {
        deployer = new DeployMoodNft();
    }

    function testConvertSvgToUri() public view {
        string
            memory expectedUri = "data:image/svg+xml;base64,PHN2ZyB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciIHdpZHRoPSIxMDAiIGhlaWdodD0iMTAwIiB2ZXJzaW9uPSIxLjEiPgogICAgPCEtLSBZZWxsb3cgY2lyY2xlIGZvciB0aGUgZmFjZSAtLT4KICAgIDxjaXJjbGUgY3g9IjUwIiBjeT0iNTAiIHI9IjQwIiBmaWxsPSJ5ZWxsb3ciIC8+CgogICAgPCEtLSBCbGFjayBjaXJjbGUgZm9yIHRoZSBsZWZ0IGV5ZSAtLT4KICAgIDxjaXJjbGUgY3g9IjM1IiBjeT0iNDAiIHI9IjUiIGZpbGw9ImJsYWNrIiAvPgoKICAgIDwhLS0gQmxhY2sgY2lyY2xlIGZvciB0aGUgcmlnaHQgZXllIC0tPgogICAgPGNpcmNsZSBjeD0iNjUiIGN5PSI0MCIgcj0iNSIgZmlsbD0iYmxhY2siIC8+CgogICAgPCEtLSBQYXRoIGZvciB0aGUgc21pbGUgLS0+CiAgICA8cGF0aCBkPSJNMzAgNjAgUTUwIDgwIDcwIDYwIiBzdHJva2U9ImJsYWNrIiBzdHJva2Utd2lkdGg9IjIiIGZpbGw9InRyYW5zcGFyZW50IiAvPgo8L3N2Zz4=";
        string
            memory svg = '<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" version="1.1"><circle cx="50" cy="50" r="40" fill="yellow"/><circle cx="35" cy="40" r="5" fill="black"/><circle cx="65" cy="40" r="5" fill="black"/><path d="M30 60 Q50 80 70 60" stroke="black" stroke-width="2" fill="transparent"/></svg>';
        string memory actualUri = deployer.svgToImagineURI(svg);

        console.log("Expected URl: ", expectedUri);
        console.log("Actual URL: ", actualUri);
        assert(
            keccak256(abi.encodePacked(actualUri)) ==
                keccak256(abi.encodePacked(expectedUri))
        );
    }
}
