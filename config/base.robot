*** Settings ***

Library     Collections
Library     RequestsLibrary
Library     JSONLibrary
Library     OperatingSystem
Library     String
Library     ${EXECDIR}/services/data/Pets.py
Resource    ${EXECDIR}/services/api-Pets/loja-pets-service.robot
