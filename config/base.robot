*** Settings ***

Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
Library     OperatingSystem
Library     String
Library     /home/runner/work/RobotExemploPetStore/RobotExemploPetStore/Services/data/Pets.py
Resource    /home/runner/work/RobotExemploPetStore/RobotExemploPetStore/Services/api-Pets/loja-pets-service.robot
#Library     ${EXECDIR}/services/data/Pets.py
#Resource    ${EXECDIR}/services/api-Pets/loja-pets-service.robot
