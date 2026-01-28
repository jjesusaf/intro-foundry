// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {Billetera} from "../src/Billetera.sol";

contract BilleteraTest is Test {
    Billetera public billetera;
    address public owner;
    address public usuario1;
    address public usuario2;

    // Se ejecuta antes de cada test
    function setUp() public {
        //owner = address(this);
        //usuario1 = makeAddr("usuario1");
        //usuario2 = makeAddr("usuario2");

        // Desplegamos el contrato con 1 ether
        //billetera = new Billetera{value: 1 ether}();
        billetera = new Billetera();
    }

    //0x0000000000000000
    function testSetOwner() public {
        billetera.setOwner(address(1));
        assertEq(billetera.owner(), address(1));
    }

    function test_RevertWhen_NotOwner() public {
        vm.prank(address(1));
        vm.expectRevert("no eres el owner");
        billetera.setOwner(address(1));
    }

    function test_SetOwner_MultipleTimes() public {
        // El owner original (este contrato) cambia el owner a address(1)
        billetera.setOwner(address(1));

        // address(1) ahora es el owner y PUEDE cambiar el owner
        vm.startPrank(address(1));
        billetera.setOwner(address(2));
        assertEq(billetera.owner(), address(2));
        vm.stopPrank();

        // address(2) ahora es el owner
        vm.startPrank(address(2));
        billetera.setOwner(address(3));
        assertEq(billetera.owner(), address(3));
        vm.stopPrank();

        // address(1) ya NO es owner, esto debe fallar
        vm.startPrank(address(1));
        vm.expectRevert("no eres el owner");
        billetera.setOwner(address(4));
        vm.stopPrank();
    }

    /*
    // Test del constructor
    function test_Constructor() public view {
        assertEq(billetera.owner(), owner);
        assertEq(address(billetera).balance, 1 ether);
    }

    // Test de la función receive
    function test_Receive() public {
        vm.deal(usuario1, 5 ether);
        
        vm.prank(usuario1);
        (bool success, ) = address(billetera).call{value: 2 ether}("");
        
        assertTrue(success);
        assertEq(address(billetera).balance, 3 ether);
    }

    // Test de retirar como owner
    function test_Retirar_ComoOwner() public {
        uint256 balanceInicial = owner.balance;
        uint256 cantidadRetirar = 0.5 ether;
        
        billetera.retirar(cantidadRetirar);
        
        assertEq(address(billetera).balance, 0.5 ether);
        assertEq(owner.balance, balanceInicial + cantidadRetirar);
    }

    // Test de retirar todo el balance
    function test_Retirar_TodoElBalance() public {
        uint256 balanceTotal = address(billetera).balance;
        uint256 balanceInicial = owner.balance;
        
        billetera.retirar(balanceTotal);
        
        assertEq(address(billetera).balance, 0);
        assertEq(owner.balance, balanceInicial + balanceTotal);
    }

    // Test de retirar sin ser owner (debe fallar)
    function test_Revert_Retirar_NoOwner() public {
        vm.prank(usuario1);
        vm.expectRevert("no eres el owner");
        billetera.retirar(0.5 ether);
    }

    // Test de setOwner como owner
    function test_SetOwner_ComoOwner() public {
        billetera.setOwner(usuario1);
        assertEq(billetera.owner(), usuario1);
    }

    // Test de setOwner sin ser owner (debe fallar)
    function test_Revert_SetOwner_NoOwner() public {
        vm.prank(usuario1);
        vm.expectRevert("no eres el owner");
        billetera.setOwner(usuario2);
    }

    // Test de cambiar owner y retirar con nuevo owner
    function test_CambiarOwner_Y_Retirar() public {
        vm.deal(usuario1, 1 ether);
        
        // Cambiar owner
        billetera.setOwner(usuario1);
        
        // El viejo owner no puede retirar
        vm.expectRevert("no eres el owner");
        billetera.retirar(0.5 ether);
        
        // El nuevo owner sí puede retirar
        uint256 balanceAntes = usuario1.balance;
        vm.prank(usuario1);
        billetera.retirar(0.5 ether);
        
        assertEq(usuario1.balance, balanceAntes + 0.5 ether);
    }

    // Test de múltiples depósitos y retiros
    function test_MultipleDepositosYRetiros() public {
        vm.deal(usuario1, 10 ether);
        vm.deal(usuario2, 10 ether);
        
        // Varios depósitos
        vm.prank(usuario1);
        payable(address(billetera)).transfer(2 ether);
        
        vm.prank(usuario2);
        payable(address(billetera)).transfer(3 ether);
        
        assertEq(address(billetera).balance, 6 ether);
        
        // Retiro parcial
        billetera.retirar(4 ether);
        assertEq(address(billetera).balance, 2 ether);
    }

    // Test fuzz: retirar diferentes cantidades
    function testFuzz_Retirar(uint96 cantidad) public {
        // Aseguramos que la cantidad no exceda el balance
        vm.assume(cantidad <= address(billetera).balance);
        
        uint256 balanceInicial = owner.balance;
        billetera.retirar(cantidad);
        
        assertEq(owner.balance, balanceInicial + cantidad);
    }

    // Helper para recibir ether (necesario para que el test pueda recibir)
    receive() external payable {}

    */
}
