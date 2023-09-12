//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Script} from "forge-std/Script.sol";
import {BasicNft} from "../src/BasicNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract M is Script {
    string public constant terra1 =
        "https://ipfs.io/ipfs/QmdNBJCr8yZubVvep7i8GTZo2aLBC3GtjDkHNYpGe17M59?filename=terra1.jpeg";

    //deploy this contract
    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNft",
            block.chainid
        );
        mintNftOnContract(mostRecentlyDeployed);
    }

    //mint the nft
    function mintNftOnContract(address basicNftAddress) public {
        vm.startBroadcast();
        BasicNft(basicNftAddress).mintNft(terra1);
        vm.stopBroadcast();
    }
}
