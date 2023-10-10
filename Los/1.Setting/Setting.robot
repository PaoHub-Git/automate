*** Settings ***
Library    SeleniumLibrary    timeout=15s    screenshot_root_directory=D:\\Scrip onborad and los\\Los\\6.Test Results\\Test Result001
Library    DateTime
Library    String
Library    Dialogs
Library    FakerLibrary
Library    RPA.Tables
Library    RPA.Excel.Files
Library    custom_library.py




Resource    ..//2.Locator/Locator.robot
Resource    ..//3.Variable/1.Login.robot
Resource    ..//3.Variable/2.Input_data.robot
Resource    ..//4.Keyword/1.Keyword.robot




