*** Settings ***

Library    SeleniumLibrary    80s    screenshot_root_directory=results/
Library    DateTime
Library    String
Library    Dialogs
Library    FakerLibrary
Library    RPA.Tables
Library    RPA.Excel.Files



Resource    ..//2.Keyword/Keywords.robot
Resource    ..//3.Task/Run task.robot