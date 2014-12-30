Feature: Ensuring that the 'wait for' steps work
    In order to make sure that the wait module works
    As a developer
    I test against the javascript test files


# VISIBILITY
    Scenario Outline: 1. I can wait for an element to appear with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the element <what> "<selector>"
          And I wait for the element <what> "<selector>" to be visible within 5 seconds

    Examples:
            | what                  | selector               |
            | with the id           | js2_block              |
            | with the name         | js2_name               |
            | named                 | js2_name               |
            | with the class name   | js2_class              |
            | with the tag name     | div                    |
            | with the css selector | div[id='js2_block']    |
            | with the xpath        | //div[@id='js2_block'] |


    Scenario Outline: 2. I can wait for an element to appear with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the element <what> "<selector>"
          And I wait for the element <what> "<selector>" to be visible

    Examples:
            | what                  | selector               |
            | with the id           | js2_block              |
            | with the name         | js2_name               |
            | named                 | js2_name               |
            | with the class name   | js2_class              |
            | with the tag name     | div                    |
            | with the css selector | div[id='js2_block']    |
            | with the xpath        | //div[@id='js2_block'] |


    Scenario Outline: 3. I can wait for a link to appear with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the link with the text "www.google.com"
          And I should not see the link with the partial text "google"
          And I wait for the element with the <what> "<selector>" to be visible within 5 seconds

    Examples:
            | what              | selector      |
            | link text         | www.google.de |
            | partial link text | google        |


    Scenario Outline: 4. I can wait for a link to appear with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the link with the text "www.google.com"
          And I should not see the link with the partial text "google"
          And I wait for the element with the <what> "<selector>" to be visible

    Examples:
            | what              | selector      |
            | link text         | www.google.de |
            | partial link text | google        |


# INVISIBILITY
    Scenario Outline: 5. I can wait for an element to disappear with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the element <what> "<selector>"
          And I wait for the element <what> "<selector>" to be invisible within 5 seconds

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
         Then I should see the element <what> "<selector>"
          And I wait for the element <what> "<selector>" to be invisible

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
          And I wait for the element with the <what> "<selector>" to be invisible within 5 seconds

    Examples:
            | what              | selector      |
            | link text         | www.amazon.de |
            | partial link text | amazon        |


    Scenario Outline: 8. I can wait for a link to disappear with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should see the link with the text "www.amazon.de"
          And I should see the link with the partial text "amazon"
          And I wait for the element with the <what> "<selector>" to be invisible

    Examples:
            | what              | selector      |
            | link text         | www.amazon.de |
            | partial link text | amazon        |



# PRESENCE
    Scenario Outline: 9. I can wait for an element to be present with timeout
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the element <what> "<selector>"
         Then I wait for the element <what> "<selector>" to be present within 5 seconds

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
         Then I should not see the element <what> "<selector>"
          And I wait for the element <what> "<selector>" to be present

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
          And I wait for the element with the <what> "<selector>" to be present within 5 seconds

    Examples:
            | what              | selector        |
            | link text         | www.present.com |
            | partial link text | present         |


    Scenario Outline: 12. I can wait for a link to be present with standard timeout (10s)
        Given I visit the salad test url "browser/waits.html"
         When I look around
         Then I should not see the link with the text "www.present.com"
          And I should not see the link with the partial text "present"
          And I wait for the element with the <what> "<selector>" to be present

    Examples:
            | what              | selector      |
            | link text         | www.present.com |
            | partial link text | present         |

# TODO
# CLICK ON (clickable)
# SELECTED (selected)
# STALE (stale)
# TO HAVE THE TEXT
# TO HAVE THE VALUE
