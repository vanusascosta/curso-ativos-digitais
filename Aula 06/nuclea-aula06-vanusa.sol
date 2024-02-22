
/*
SPDX-License-Identifier: CC-BY-4.0
(c) Desenvolvido por Jeff Prestes
This work is licensed under a Creative Commons Attribution 4.0 International License.
*/
pragma solidity 0.8.19;

// endereço do contrato: 0x067745684aC261335121d36bDbe555E4F649Fe83
// Realizei 2 tentativas com a minha Account - 0x4B6164d4c0b0B062Fe087303aD17052069dCd20B

/// @author Vanusa Costa
/// @title Um exemplo de Faucet
contract Faucet {

    mapping(address=>uint8) public tentativas;
    uint8 numeroTentativa;

    event AconteceuUmaTentativa(address quemTentou, uint8 quantidadeTentativas);

    // @notice Fornece a quem chamar a transacao uma tentativa
    // @dev incrementa um no acumulador de tentativas e atribui o numero da tentativa a um endereco ethereum.
    // @return numero de tentativas
    function executarTentativa() public returns (uint256) {
        require(tentativas[msg.sender]<=3, "Sinto muito. Voce so pode realizar 3 tentativas");
        require(numeroTentativa < 4, "Sinto muito. Voce perdeu sua chance");
        numeroTentativa++;
        tentativas[msg.sender] = numeroTentativa;
        emit AconteceuUmaTentativa(msg.sender, numeroTentativa);
        return numeroTentativa;
    }

}
