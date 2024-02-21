// SPDX-License-Identifier: CC-BY-4.0
pragma solidity ^0.8.24;

// endereço do contrato: 0x478497d9819fa60F95EFB9e9565de8403E143FBA

import "./lib-IERC20.sol";

/// @author Vanusa Costa
/// @title Obter Saldo
contract Saldo {
    function ObterSaldo(address token_, address pessoa_) public view returns (uint256) {
        IERC20 token = IERC20(token_);
        return token.balanceOf(pessoa_);
    }
        
}

