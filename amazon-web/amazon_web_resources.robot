*** Settings ***
Library           SeleniumLibrary
Library           String
Library           RequestsLibrary
Library           FakerLibrary
Library           Collections

*** Variables ***

${REMOTE_URL}     localhost:7272     #http://localhost:4444/wd/hub
#${Browser}        %{BROWSER}
${Browser}           chrome

#URL
${LoginURL}                        https://www.amazon.com/

#-- Home Page Locators --#
${homePage.discoverAmazon.field}            xpath=//*[@id="rIPiUqQ7v6ymFnEB8eN4pg"]/div[1]/h2/span

#-- Home Page Texts --#
${homePage.discoverAmazon.text}             Discover Amazon

#-- Layout Locators --#
${layout.searchBar.input}                                             xpath=//input[@id='twotabsearchtextbox']
${layout.searchBar.submit.field}                                      xpath=//div[@class='nav-search-submit nav-sprite']
${layout.searchBar.category.all.field}                                xpath=//div[@class='nav-search-scope nav-sprite']
${layout.searchBar.category.artsAndCrafts.field}                      xpath=//option[@value='search-alias=arts-crafts-intl-ship']
${layout.category.icon.field}                                         xpath=//a[@id='nav-hamburger-menu']
${layout.category.menu.title.field}                                   xpath=//div[@class='hmenu-item hmenu-title ']
${layout.category.menu.electronics.field}                             xpath=//*[@id="hmenu-content"]/ul[1]/li[6]/a
${layout.category.menu.sub.headphones.field}                          xpath=//*[@id="hmenu-content"]/ul[5]/li[9]/a
${layout.category.menu.sub.title.field}                               xpath=//div[@class='hmenu-item hmenu-title ']

#-- Layout Texts --#
${layout.searchBar.category.artsAndCrafts.text}                       Arts & Crafts
${layout.category.menu.title.text}                                    SHOP BY CATEGORY
${layout.category.menu.electronics.text}                              Electronics
${layout.category.menu.electronics.title.text}                        ELECTRONICS
${layout.category.menu.sub.headphones.text}                           Headphones

#-- Search Locators --#
${search.result.toolbar.title.field}                                  xpath=//h1[@class='a-size-base s-desktop-toolbar a-text-normal']

#-- Search Texts --#
${search.product.text}                                                pencil



*** Keywords ***
#Open Amazon#
Open Amazon
    Open Browser    ${LoginURL}    ${Browser}      ${REMOTE_URL}
    Run Keyword And Continue On Failure     Maximize Browser Window

#Check HomePage#
Check Discover Amazon
    Wait Until Page Contains Element    ${homePage.discoverAmazon.field}
    Page Should Contain Element    ${homePage.discoverAmazon.field}
    Element Should Contain    ${homePage.discoverAmazon.field}    ${homePage.discoverAmazon.text}

#Check Layout#
Check Search Bar
    Wait Until Page Contains Element    ${layout.searchBar.input}
    Page Should Contain Element    ${layout.searchBar.input}

#Search Product#
Input Product Name Search Bar
    Click Element    ${layout.searchBar.input}
    Input Text    ${layout.searchBar.input}    ${search.product.text}

Click Search Submit
    Click Element    ${layout.searchBar.submit.field}

Check Search Result
    Wait Until Page Contains Element    ${search.result.toolbar.title.field}
    Page Should Contain Element    ${search.result.toolbar.title.field}
    Element Should Contain    ${search.result.toolbar.title.field}    ${search.product.text}

#Search With Specific Category#
Click Search Categories All
    Page Should Contain Element    ${layout.searchBar.category.all.field}
    Click Element    ${layout.searchBar.category.all.field}

Click Search Specific Category
    Wait Until Element Is Visible    ${layout.searchBar.category.artsAndCrafts.field}
    Element Should Contain    ${layout.searchBar.category.artsAndCrafts.field}      ${layout.searchBar.category.artsAndCrafts.text}
    Click Element    ${layout.searchBar.category.artsAndCrafts.field}

Check Search Specific Category
    Wait Until Page Contains Element    ${search.result.toolbar.title.field}
    Page Should Contain Element    ${search.result.toolbar.title.field}
    Element Should Contain    ${search.result.toolbar.title.field}    ${layout.searchBar.category.artsAndCrafts.text}

#Shop By Spesific Category#
Click Category Icon
    Wait Until Element Is Visible    ${layout.category.icon.field}
    Click Element    ${layout.category.icon.field}

Check Category Menu
    Wait Until Page Contains Element    ${layout.category.menu.title.field}
    Wait Until Element Contains    ${layout.category.menu.title.field}    ${layout.category.menu.title.text}
    Element Should Contain    ${layout.category.menu.title.field}    ${layout.category.menu.title.text}

Click Category Menu Specific Category
    Wait Until Element Contains    ${layout.category.menu.electronics.field}    ${layout.category.menu.electronics.text}
    Element Should Contain    ${layout.category.menu.electronics.field}    ${layout.category.menu.electronics.text}
    Click Element    ${layout.category.menu.electronics.field}

Check Category Menu Specific Category Title
    Wait Until Page Contains Element   ${layout.category.menu.sub.title.field}
    Wait Until Element Contains    ${layout.category.menu.sub.title.field}     ${layout.category.menu.electronics.title.text}
    Element Should Contain    ${layout.category.menu.sub.title.field}     ${layout.category.menu.electronics.title.text}

Click Category Menu Specific Sub Category
    Wait Until Page Contains    ${layout.category.menu.sub.headphones.text}
    Element Should Contain    ${layout.category.menu.sub.headphones.field}    ${layout.category.menu.sub.headphones.text}
    Click Element    ${layout.category.menu.sub.headphones.field}

Check Specific Category Filter
    Wait Until Page Contains Element    ${search.result.toolbar.title.field}
    Page Should Contain Element    ${search.result.toolbar.title.field}
    Element Should Contain    ${search.result.toolbar.title.field}    ${layout.category.menu.sub.headphones.text}
