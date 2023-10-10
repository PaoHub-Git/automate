*** Settings ***
Library    SeleniumLibrary    60s    screenshot_root_directory=results/
Library    DateTime
Library    String
Library    Dialogs
Library    FakerLibrary
Library    RPA.Tables
Library    RPA.Excel.Files
Library    custom_library.py
Library    Collections
Library    custom_library_Edge.py





Resource    ..//3.Variable/Variable.robot
Resource    ..//4.Keyword/Keyword.robot
Resource    ..//4.Keyword/KW_Change language.robot




