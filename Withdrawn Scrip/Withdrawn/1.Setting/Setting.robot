*** Settings ***

Library    SeleniumLibrary    20s    screenshot_root_directory=results/
Library    DateTime
Library    String
Library    Dialogs
Library    FakerLibrary
Library    RPA.Tables
Library    RPA.Excel.Files
Library    custom_library.py
Library    custom_library_Edge.py




Resource    ..//2.Locator/Locator.robot
Resource    ..//3.Variable/1.Login.robot
Resource    ..//3.Variable/2.Input_data.robot
Resource    ..//4.Keyword/1.Keyword.robot




