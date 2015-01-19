Feature: Ensuring that the 'wait for' steps work
    In order to make sure that the wait module works
    As a developer
    I test against the javascript test files


# VISIBILITY
    Scenario Outline: 1. I can wait for an element to appear with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the element with the id "js2_block"
         When I wait for the element <what> "<selector>" to be visible within 5 seconds
         Then I should see the element with the id "js2_block"

    Examples:
        | what                  | selector                  |
        | with the id           | js2_block                 |
        | with the name         | js2_name                  |
        | named                 | js2_name                  |
        | with the class name   | js2_class                 |
        | with the tag name     | visdiv                    |
        | with the css selector | visdiv[id='js2_block']    |
        | with the xpath        | //visdiv[@id='js2_block'] |


    Scenario Outline: 2. I can wait for an element to appear with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the element with the id "js2_block"
          And I wait for the element <what> "<selector>" to be visible
         Then I should see the element with the id "js2_block"

    Examples:
        | what                  | selector                  |
        | with the id           | js2_block                 |
        | with the name         | js2_name                  |
        | named                 | js2_name                  |
        | with the class name   | js2_class                 |
        | with the tag name     | visdiv                    |
        | with the css selector | visdiv[id='js2_block']    |
        | with the xpath        | //visdiv[@id='js2_block'] |


    Scenario Outline: 3. I can wait for a link to appear with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the link with the text "www.google.de"
          And I should not see the link with the partial text "google"
         When I wait for the element with the <what> "<selector>" to be visible within 5 seconds
         Then I should see the link with the text "www.google.de"
          And I should see the link with the partial text "google"

    Examples:
        | what              | selector      |
        | link text         | www.google.de |
        | partial link text | google        |


    Scenario Outline: 4. I can wait for a link to appear with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the link with the text "www.google.de"
          And I should not see the link with the partial text "google"
         When I wait for the element with the <what> "<selector>" to be visible
         Then I should see the link with the text "www.google.de"
          And I should see the link with the partial text "google"

    Examples:
        | what              | selector      |
        | link text         | www.google.de |
        | partial link text | google        |


# INVISIBILITY
    Scenario Outline: 5. I can wait for an element to disappear with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the id "shown_div"
         When I wait for the element <what> "<selector>" to be invisible within 5 seconds
         Then I should not see the element with the id "shown_div"

    Examples:
        | what                  | selector                 |
        | with the id           | shown_div                |
        | with the name         | shown_name               |
        | named                 | shown_name               |
        | with the class name   | shown_class              |
        | with the tag name     | mydiv                    |
        | with the css selector | mydiv[id='shown_div']    |
        | with the xpath        | //mydiv[@id='shown_div'] |


    Scenario Outline: 6. I can wait for an element to disappear with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the id "shown_div"
         When I wait for the element <what> "<selector>" to be invisible
         Then I should not see the element with the id "shown_div"

    Examples:
        | what                  | selector                 |
        | with the id           | shown_div                |
        | with the name         | shown_name               |
        | named                 | shown_name               |
        | with the class name   | shown_class              |
        | with the tag name     | mydiv                    |
        | with the css selector | mydiv[id='shown_div']    |
        | with the xpath        | //mydiv[@id='shown_div'] |


    Scenario Outline: 7. I can wait for a link to disappear with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the link with the text "www.amazon.de"
          And I should see the link with the partial text "amazon"
         When I wait for the element with the <what> "<selector>" to be invisible within 5 seconds
         Then I should not see the link with the text "www.amazon.de"
          And I should not see the link with the partial text "amazon"

    Examples:
        | what              | selector      |
        | link text         | www.amazon.de |
        | partial link text | amazon        |


    Scenario Outline: 8. I can wait for a link to disappear with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the link with the text "www.amazon.de"
          And I should see the link with the partial text "amazon"
         When I wait for the element with the <what> "<selector>" to be invisible
         Then I should not see the link with the text "www.amazon.de"
          And I should not see the link with the partial text "amazon"

    Examples:
        | what              | selector      |
        | link text         | www.amazon.de |
        | partial link text | amazon        |


# PRESENCE
    Scenario Outline: 9. I can wait for an element to be present with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the element with the id "present"
         When I wait for the element <what> "<selector>" to be present within 5 seconds
         Then I should see the element with the id "present"

    Examples:
        | what                  | selector           |
        | with the id           | present            |
        | with the name         | present_name       |
        | named                 | present_name       |
        | with the class name   | present_class      |
        | with the tag name     | p                  |
        | with the css selector | p[id='present']    |
        | with the xpath        | //p[@id='present'] |


    Scenario Outline: 10. I can wait for an element to be present with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the element with the id "present"
         When I wait for the element <what> "<selector>" to be present
         Then I should see the element with the id "present"

    Examples:
        | what                  | selector           |
        | with the id           | present            |
        | with the name         | present_name       |
        | named                 | present_name       |
        | with the class name   | present_class      |
        | with the tag name     | p                  |
        | with the css selector | p[id='present']    |
        | with the xpath        | //p[@id='present'] |


    Scenario Outline: 11. I can wait for a link to be present with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the link with the text "www.present.com"
          And I should not see the link with the partial text "present"
         When I wait for the element with the <what> "<selector>" to be present within 5 seconds
         Then I should see the link with the text "www.present.com"
          And I should see the link with the partial text "present"

    Examples:
        | what              | selector        |
        | link text         | www.present.com |
        | partial link text | present         |


    Scenario Outline: 12. I can wait for a link to be present with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the link with the text "www.present.com"
          And I should not see the link with the partial text "present"
         When I wait for the element with the <what> "<selector>" to be present
         Then I should see the link with the text "www.present.com"
          And I should see the link with the partial text "present"

    Examples:
        | what              | selector        |
        | link text         | www.present.com |
        | partial link text | present         |


# CLICKABLE
    Scenario Outline: 13. I can wait for an element to be clickable with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the css selector "button.button"
         When I click on the element with the css selector "button.button"
         Then I should not see that the element with the id "always_there" has the text "clicked button"
         When I wait for the element <what> "<selector>" to be clickable within 7 seconds
          And I click on the element with the css selector "button.button"
         Then I should see that the element with the id "always_there" has the text "clicked button"

    Examples:
        | what                  | selector |
        | with the id           | button   |
        | with the name         | button   |
        | named                 | button   |
        | with the class name   | button   |
        | with the tag name     | button   |
        | with the css selector | button   |
        | with the xpath        | //button |


    Scenario Outline: 14. I can wait for an element to be clickable with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the css selector "button.button"
         When I click on the element with the css selector "button.button"
         Then I should not see that the element with the id "always_there" has the text "clicked button"
         When I wait for the element <what> "<selector>" to be clickable
          And I click on the element with the css selector "button.button"
         Then I should see that the element with the id "always_there" has the text "clicked button"

    Examples:
        | what                  | selector |
        | with the id           | button   |
        | with the name         | button   |
        | named                 | button   |
        | with the class name   | button   |
        | with the tag name     | button   |
        | with the css selector | button   |
        | with the xpath        | //button |


    # it actually does not make much sense to use 'clickable' with links, because
    # they cannot truly be disabled in a way that selenium recognizes as
    # 'disabled', even though from the user's perspective, the link can in fact
    # be disabled as it is on the html page used in this test.
    # -> if element and element.is_enabled() will always be true for a visible link
    Scenario Outline: 15. I can wait for a link to be clickable with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the link with the text "disabled link"
          And I should not see the link with the text "enabled link"
         When I click on the link with the text "disabled link"
         Then I should not see that the element with the id "always_there" has the text "clicked link"
         When I wait for the element with the <what> "<selector>" to be clickable within 5 seconds
         Then I should see the link with the text "enabled link" within 5 seconds
          And I should not see the link with the text "disabled link"
          And I wait 1 second
         When I click on the link with the text "enabled link"
         Then I should see that the element with the id "always_there" has the text "clicked link"

    Examples:
        | what              | selector      |
        | link text         | disabled link |
        | partial link text | disabled      |


    Scenario Outline: 16. I can wait for a link to be clickable with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the link with the text "disabled link"
          And I should not see the link with the text "enabled link"
         When I click on the link with the text "disabled link"
         Then I should not see that the element with the id "always_there" has the text "clicked link"
         When I wait for the element with the <what> "<selector>" to be clickable
         Then I should see the link with the text "enabled link" within 5 seconds
          And I should not see the link with the text "disabled link"
          And I wait 1 second
         When I click on the link with the text "enabled link"
         Then I should see that the element with the id "always_there" has the text "clicked link"

    Examples:
        | what              | selector      |
        | link text         | disabled link |
        | partial link text | disabled      |


# (UN)SELECTED
    Scenario Outline: 17. I can wait for an element to be selected with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the id "select"
          And I should see the element with the css selector "select option[value='2'][selected='selected']"
          And I should not see the element with the css selector "select option[value='1'][selected='selected']"
         When I wait for the element <what> "<selector>" to be selected within 5 seconds
         Then I should see the element with the css selector "select option[value='1'][selected='selected']"
          And I should not see the element with the css selector "select option[value='2'][selected='selected']"

    Examples:
        | what                  | selector             |
        | with the id           | val1                 |
        | with the name         | nam1                 |
        | named                 | nam1                 |
        | with the class name   | c1                   |
        | with the tag name     | option               |
        | with the css selector | .c1                  |
        | with the xpath        | //option[@id='val1'] |


    Scenario Outline: 18. I can wait for an element to be selected with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the id "select"
          And I should see the element with the css selector "select option[value='2'][selected='selected']"
          And I should not see the element with the css selector "select option[value='1'][selected='selected']"
         When I wait for the element <what> "<selector>" to be selected
         Then I should see the element with the css selector "select option[value='1'][selected='selected']"
          And I should not see the element with the css selector "select option[value='2'][selected='selected']"

    Examples:
        | what                  | selector             |
        | with the id           | val1                 |
        | with the name         | nam1                 |
        | named                 | nam1                 |
        | with the class name   | c1                   |
        | with the tag name     | option               |
        | with the css selector | .c1                  |
        | with the xpath        | //option[@id='val1'] |


    Scenario Outline: 19. I can wait for an element to be unselected with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the id "select"
          And I should see the element with the css selector "select option[value='2'][selected='selected']"
          And I should not see the element with the css selector "select option[value='1'][selected='selected']"
         When I wait for the element <what> "<selector>" to be unselected within 5 seconds
         Then I should see the element with the css selector "select option[value='1'][selected='selected']"
          And I should not see the element with the css selector "select option[value='2'][selected='selected']"

    Examples:
        | what                  | selector             |
        | with the id           | val2                 |
        | with the name         | nam2                 |
        | named                 | nam2                 |
        | with the class name   | c2                   |
        # cannot re-use tag name since the first matching element with the
        # tag name 'option' is used, and that is the one in scenarios 17 and 18
        | with the css selector | .c2                  |
        | with the xpath        | //option[@id='val2'] |


    Scenario Outline: 20. I can wait for an element to be unselected with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the id "select"
          And I should see the element with the css selector "select option[value='2'][selected='selected']"
          And I should not see the element with the css selector "select option[value='1'][selected='selected']"
         When I wait for the element <what> "<selector>" to be unselected
         Then I should see the element with the css selector "select option[value='1'][selected='selected']"
          And I should not see the element with the css selector "select option[value='2'][selected='selected']"

    Examples:
        | what                  | selector             |
        | with the id           | val2                 |
        | with the name         | nam2                 |
        | named                 | nam2                 |
        | with the class name   | c2                   |
        # cannot re-use tag name since the first matching element with the
        # tag name 'option' is used, and that is the one in scenarios 17 and 18
        | with the css selector | .c2                  |
        | with the xpath        | //option[@id='val2'] |

    # this time i'm skipping links, because links cannot be selected or unselected

# STALENESS
    Scenario Outline: 21. I can wait for an element to be stale with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the id "stale"
         When I wait for the element <what> "<selector>" to <wording> within 5 seconds
         Then I should not see the element with the id "stale"

    Examples:
        | what                  | selector                | wording   |
        | with the id           | stale                   | be stale  |
        | with the name         | stale                   | be stale  |
        | named                 | stale                   | be stale  |
        | with the class name   | stale                   | be stale  |
        | with the tag name     | divstale                | be stale  |
        | with the css selector | divstale.stale          | be stale  |
        | with the xpath        | //divstale[@id='stale'] | be stale  |
        | with the id           | stale                   | be gone   |
        | with the name         | stale                   | be gone   |
        | named                 | stale                   | be gone   |
        | with the class name   | stale                   | be gone   |
        | with the tag name     | divstale                | be gone   |
        | with the css selector | divstale.stale          | be gone   |
        | with the xpath        | //divstale[@id='stale'] | be gone   |
        | with the id           | stale                   | disappear |
        | with the name         | stale                   | disappear |
        | named                 | stale                   | disappear |
        | with the class name   | stale                   | disappear |
        | with the tag name     | divstale                | disappear |
        | with the css selector | divstale.stale          | disappear |
        | with the xpath        | //divstale[@id='stale'] | disappear |


    Scenario Outline: 22. I can wait for an element to be stale with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element with the id "stale"
         When I wait for the element <what> "<selector>" to <wording>
         Then I should not see the element with the id "stale"

    Examples:
        | what                  | selector                | wording   |
        | with the id           | stale                   | be stale  |
        | with the name         | stale                   | be stale  |
        | named                 | stale                   | be stale  |
        | with the class name   | stale                   | be stale  |
        | with the tag name     | divstale                | be stale  |
        | with the css selector | divstale.stale          | be stale  |
        | with the xpath        | //divstale[@id='stale'] | be stale  |
        | with the id           | stale                   | be gone   |
        | with the name         | stale                   | be gone   |
        | named                 | stale                   | be gone   |
        | with the class name   | stale                   | be gone   |
        | with the tag name     | divstale                | be gone   |
        | with the css selector | divstale.stale          | be gone   |
        | with the xpath        | //divstale[@id='stale'] | be gone   |
        | with the id           | stale                   | disappear |
        | with the name         | stale                   | disappear |
        | named                 | stale                   | disappear |
        | with the class name   | stale                   | disappear |
        | with the tag name     | divstale                | disappear |
        | with the css selector | divstale.stale          | disappear |
        | with the xpath        | //divstale[@id='stale'] | disappear |


    Scenario Outline: 23. I can wait for a link to be stale with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the link with the text "this link will be stale"
         When I wait for the link with the <what> "<selector>" to <wording> within 5 seconds
         Then I should not see the link with the text "this link will be stale"

    Examples:
        | what              | selector                | wording   |
        | link text         | this link will be stale | be stale  |
        | partial link text | link will be            | be stale  |
        | link text         | this link will be stale | be gone   |
        | partial link text | link will be            | be gone   |
        | link text         | this link will be stale | disappear |
        | partial link text | link will be            | disappear |


    Scenario Outline: 24. I can wait for a link to be stale with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the link with the text "this link will be stale"
         When I wait for the link with the <what> "<selector>" to <wording>
         Then I should not see the link with the text "this link will be stale"

    Examples:
        | what              | selector                | wording   |
        | link text         | this link will be stale | be stale  |
        | partial link text | link will be            | be stale  |
        | link text         | this link will be stale | be gone   |
        | partial link text | link will be            | be gone   |
        | link text         | this link will be stale | disappear |
        | partial link text | link will be            | disappear |


# TODO
# HAVING TEXT
    Scenario Outline: 25. I can wait for an element to have a text with timeout
    Scenario Outline: 26. I can wait for an element to have a text with standard timeout (10s)
    Scenario Outline: 27. I can wait for a link to have a text with timeout
    Scenario Outline: 28. I can wait for a link to have a text with standard timeout (10s)
# HAVING VALUE
    Scenario Outline: 29. I can wait for an element to have a value with timeout
    Scenario Outline: 30. I can wait for an element to have a value with standard timeout (10s)
    Scenario Outline: 31. I can wait for a link to have a value with timeout
    Scenario Outline: 32. I can wait for a link to have a value with standard timeout (10s)


# WAIT FOR ALERT
    Scenario Outline: 33. I can wait for an alert to appear with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
          And I run the javascript "want_alert = true;"
         Then I should not see an alert
         When I wait until <wording> an alert within 5 seconds
         Then I should see an alert

    Examples:
        | wording  |
        | I see    |
        | there is |
        | I see    |
        | there is |

    Scenario Outline: 34. I can wait for an alert to appear with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
          And I run the javascript "want_alert = true;"
         Then I should not see an alert
         When I wait until <wording> an alert
         Then I should see an alert

    Examples:
        | wording  |
        | I see    |
        | there is |
        | I see    |
        | there is |
