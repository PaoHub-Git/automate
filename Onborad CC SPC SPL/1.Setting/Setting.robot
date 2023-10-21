*** Settings ***

Library    SeleniumLibrary    80s    screenshot_root_directory=D:\\automate\\Onborad CC SPC SPL\\results
Library    DateTime
Library    String
Library    Dialogs
Library    FakerLibrary
Library    RPA.Tables
Library    RPA.Excel.Files
Library    OperatingSystem



Resource    ..//2.Keyword/Keywords.robot
Resource    ..//3.Task/Run task.robot