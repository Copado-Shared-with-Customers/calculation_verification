*** Settings ***

Documentation          New test suite
Library                QForce
Suite Setup            Setup Browser
Suite Teardown         Close All Browsers

*** Keywords ***
Setup Browser
    Open Browser       about:blank                 chrome
    Set Config         DefaultTimeout              45s

*** Test Cases ***
Verify Addition Operation On Calculator
    [Documentation]    Validates that the online calculator at https://calculatorpi.com/
    ...                correctly adds two numbers (4 and 5) and displays the result (9).
    [Tags]             Addition                    Calculator

    # Launching a calculator to verify mathematical calculations
    GoTo               https://calculatorpi.com/
    ClickText          4
    ClickText          +
    ClickText          5
    VerifyText          Calculate

    # Here, we perform calculations using Copado Robotic Testing.
    # To confirm the accuracy of the calculator's sums, we store the result in a variable.
    # This allows us to validate the displayed outcome later on the screen.
    ${result}          Evaluate                    4+5
    ${result}          Convert To String           ${result}

    # Finally, conducting validation against the calculator:
    VerifyText         \= ${result}