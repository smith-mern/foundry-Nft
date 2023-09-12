//SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {Test} from "forge-std/Test.sol";
import {DeployBasicNft} from "../../script/DeployBasicNFT.s.sol";
import {BasicNft} from "../../src/BasicNft.sol";

contract BasicNftTest is Test {
    DeployBasicNft public deployer;
    BasicNft public basicNft;
    address public USER = makeAddr("user");
    string public constant terra1 =
        "https://ipfs.io/ipfs/QmdNBJCr8yZubVvep7i8GTZo2aLBC3GtjDkHNYpGe17M59?filename=terra1.jpeg";

    function setUp() public {
        deployer = new DeployBasicNft();
        basicNft = deployer.run();
    }

    function testNameIsCorrect() public view {
        string memory expectedName = "Terra";
        string memory actualName = basicNft.name();

        // comparing hashing using keccak256
        assert(
            keccak256(abi.encodePacked(expectedName)) ==
                keccak256(abi.encodePacked(actualName))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNft.mintNft("terra1");

        assert(basicNft.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked("terra1")) ==
                keccak256(abi.encodePacked(basicNft.tokenURI(0)))
        );
    }
}
