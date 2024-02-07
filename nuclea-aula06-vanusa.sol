/*
SPDX-License-Identifier: CC-BY-4.0
(c) Desenvolvido por Jeff Prestes
This work is licensed under a Creative Commons Attribution 4.0 International License.
*/
pragma solidity 0.8.19;

// endereço do contrato: 

/// @author Vanusa Costa
/// @title Um exemplo de Faucet
contract Faucet {

    mapping(address=>uint8) public tentativas;
    uint8 numeroTentativa;

    event AconteceuUmaTentativa(address quemTentou, uint8 quantidadeTentativas);

    // @notice Fornece a quem chamar a transacao um valor
    // @dev incrementa um no acumulador de tentativas e atribuir o valor da tentativa a um endereco ethereum.
    // @return valor atual de tentativas
    function executarTentativa() public returns (uint256) {
        require(tentativas[msg.sender]<=3, "Sinto muito. Voce so pode realizar 3 tentativas");
        require(numeroTentativa < 4, "Sinto muito. Voce perdeu sua chance");
        numeroTentativa++;
        tentativas[msg.sender] = numeroTentativa;
        emit AconteceuUmaTentativa(msg.sender, numeroTentativa);
        return numeroTentativa;
    }

}
