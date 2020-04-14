pragma solidity >=0.4.16 <0.7.0;

import "@openzeppelin/token/ERC20/IERC20.sol";


contract Swap {
    address owner;
    address constant opacityAddress = address(
        0x77599D2C6DB170224243e255e6669280F11F1473
    );
    IERC20 constant opacityToken = IERC20(opacityAddress);
    uint8[] validTokenAmounts = [2, 16, 32];
    uint256 constant tokenPrice = 75000000000000;

    modifier ownerOnly {
        require(msg.sender == owner, "You are not the owner of contract");
        _;
    }

    function isTokenAmountValid(uint8 tokenAmount) private view returns (bool) {
        for (uint8 i; i < validTokenAmounts.length; i++) {
            if (tokenAmount == validTokenAmounts[i]) {
                return true;
            }
        }
        return false;
    }

    function swap(uint8 amount) public payable {
        require(
            msg.value >= amount * tokenPrice,
            "You sent incorrect amount of Ether"
        );

        opacityToken.transfer(msg.sender, amount);
    }
}
