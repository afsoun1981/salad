# -*- coding: utf-8 -*-

import re

from lettuce import step, world
from selenium.common.exceptions import TimeoutException
from selenium.common.exceptions import NoSuchElementException
from selenium.common.exceptions import StaleElementReferenceException
from selenium.common.exceptions import WebDriverException
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC


"""
    This module offers steps that use the selenium build-in expected
    conditions. The tests for these steps are in steps-..-waits.feature
    All finders in By are supported: ID, XPATH, LINK_TEXT, PARTIAL_LINK_TEXT,
    NAME, TAG_NAME, CLASS_NAME, CSS_SELECTOR. Not all expected conditions
    are supported, but these are: presence_of_element_located,
    (in)visibility_of_element_located, element_to_be_clickable,
    text_to_be_present_in_element, text_to_be_present_in_element_value,
    element_located_selection_state_to_be, staleness_of, alert_is_present.
"""
WAIT_OPTIONS = {
    'be present': EC.presence_of_element_located,
    'be visible': EC.visibility_of_element_located,
    'be clickable': EC.element_to_be_clickable,
    'be invisible': EC.invisibility_of_element_located,
}
WAIT_TEXT_OPTIONS = {
    'have the text "([^"]+)"': EC.text_to_be_present_in_element,
    'have the value "([^"]+)"': EC.text_to_be_present_in_element_value,
}
WAIT_SELECTED_OPTIONS = {
    'be selected': (EC.element_located_selection_state_to_be, True),
    'be unselected': (EC.element_located_selection_state_to_be, False),
}
WAIT_STALE_OPTIONS = {
    '(be stale|be gone|disappear)': EC.staleness_of,
}
ELEMENT_FINDERS = {
    'named "([^"]*)"': By.NAME,
    'with(?: the)? name "([^"]*)"': By.NAME,
    'with(?: the)? tag name "([^"]*)"': By.TAG_NAME,
    'with(?: the)? class name "([^"]*)"': By.CLASS_NAME,
    'with(?: the)? id "([^"]*)"': By.ID,
    'with(?: the)? css selector "([^"]*)"': By.CSS_SELECTOR,
    'with(?: the)? xpath "([^"]*)"': By.XPATH,
    'with(?: the)? link text "([^"]*)"': By.LINK_TEXT,
    'with(?: the)? partial link text "([^"]*)"': By.PARTIAL_LINK_TEXT,
}
THING_STRING = (
    "(?:element|thing|field|textarea|radio button|button|checkbox|label|link)")


def _construct_name(find_by, condition_string):
        if '(be stale|' in condition_string:
            condition_string = 'be stale'
        name = "wait_for_element_by_{finder}_to_{have_condition}".format(
            finder=find_by, have_condition=condition_string)
        name = name.replace(" ", "_")
        name = re.sub(r'("\(.*\)")', "", name)
        name = name.rstrip("_")
        return name


# WAIT FOR ELEMENT TO BE (UN)SELECTED
def _wait_for_selected_generator(finder_string, find_by, condition_string,
                                 expected_condition, expected_selection_state):
    pattern = (r'wait for the {thing} {with_the_finder} to '
               '{have_selection_state}(?: within (\d+) seconds)?$'.format(
                   thing=THING_STRING, with_the_finder=finder_string,
                   have_selection_state=condition_string))

    @step(pattern)
    def _this_step(step, selector, wait_time):
        wait_time = int(wait_time or 10)
        wait = WebDriverWait(world.browser.driver, wait_time)
        try:
            wait.until(expected_condition((find_by, selector),
                                          expected_selection_state))
        except TimeoutException as e:
            msg = ("The element %s '%s' was not '%s' within %s seconds. "
                   "The error message was: '%s'." %
                   (finder_string, selector, condition_string, wait_time, e))
            raise AssertionError(msg)
    return _this_step


# build the steps that wait for an element to have a certain selection state
for condition_string, ec_tuple in WAIT_SELECTED_OPTIONS.iteritems():
    for finder_string, find_by in ELEMENT_FINDERS.iteritems():
        expected_condition, expected_selection_state = ec_tuple
        _wait_for_selected_generator(
            finder_string, find_by,
            condition_string, expected_condition, expected_selection_state
        )
        name = _construct_name(find_by, condition_string)
        globals()[name] = (
            _wait_for_selected_generator(finder_string, find_by,
                                         condition_string, expected_condition,
                                         expected_selection_state))


# WAIT FOR ELEMENT TO HAVE A CERTAIN CONDITION
def _wait_for_generator(finder_string, find_by,
                        condition_string, expected_condition):
    pattern = (r'wait for the {thing} {with_the_finder} to {have_condition}'
               '(?: within (\d+) seconds)?$'.format(
                   thing=THING_STRING, with_the_finder=finder_string,
                   have_condition=condition_string))

    @step(pattern)
    def _this_step(step, selector, wait_time):
        wait_time = int(wait_time or 10)
        wait = WebDriverWait(world.browser.driver, wait_time)
        try:
            wait.until(expected_condition((find_by, selector)))
        except TimeoutException as e:
            msg = ("The element %s '%s' was not '%s' within %s seconds. "
                   "The error message was: '%s'." %
                   (finder_string, selector, condition_string, wait_time, e))
            raise AssertionError(msg)
    return _this_step


# build the steps that wait for an element to have a certain condition
for condition_string, expected_condition in WAIT_OPTIONS.iteritems():
    for finder_string, find_by in ELEMENT_FINDERS.iteritems():
        _wait_for_generator(finder_string, find_by,
                            condition_string, expected_condition)
        name = _construct_name(find_by, condition_string)
        globals()[name] = (_wait_for_generator(finder_string, find_by,
                                               condition_string,
                                               expected_condition))


# WAIT FOR ELEMENT TO HAVE A CERTAIN TEXT/VALUE
def _wait_for_text_generator(finder_string, find_by,
                             condition_string, expected_condition):
    pattern = (r'wait for the {thing} {with_the_finder} to '
               '{have_text_or_value}(?: within (\d+) seconds)?$'.format(
                   thing=THING_STRING, with_the_finder=finder_string,
                   have_text_or_value=condition_string))

    @step(pattern)
    def _this_step(step, selector, text, wait_time):
        wait_time = int(wait_time or 10)
        wait = WebDriverWait(world.browser.driver, wait_time)
        try:
            wait.until(expected_condition((find_by, selector), text))
        except TimeoutException as e:
            msg = ("The element %s '%s' did not %s '%s' within %s seconds. "
                   "The error message was: '%s'." %
                   (finder_string, selector, condition_string, text,
                    wait_time, e))
            raise AssertionError(msg)
    return _this_step


# build the steps that wait for an element to have a certain text/value
for condition_string, expected_condition in WAIT_TEXT_OPTIONS.iteritems():
    for finder_string, find_by in ELEMENT_FINDERS.iteritems():
        _wait_for_text_generator(finder_string, find_by,
                                 condition_string, expected_condition)
        name = _construct_name(find_by, condition_string)
        globals()[name] = (_wait_for_text_generator(finder_string, find_by,
                                                    condition_string,
                                                    expected_condition))


# WAIT FOR ELEMENT TO BE STALE
def _wait_for_stale_generator(finder_string, find_by,
                              condition_string, expected_condition):
    pattern = (r'wait for the {thing} {with_the_finder} to '
               '{be_stale}(?: within (\d+) seconds)?$'.format(
                   thing=THING_STRING, with_the_finder=finder_string,
                   be_stale=condition_string))

    @step(pattern)
    def _this_step(step, selector, text, wait_time):
        wait_time = int(wait_time or 10)
        wait = WebDriverWait(world.browser.driver, wait_time)
        try:
            element = world.browser.driver.find_element(find_by, selector)
            wait.until(expected_condition(element))
        except TimeoutException as e:
            msg = ("The element %s '%s' was not %s within %s seconds. "
                   "The error message was: '%s'." %
                   (finder_string, selector, condition_string,
                    wait_time, e))
            raise AssertionError(msg)
        except (NoSuchElementException, StaleElementReferenceException,
                WebDriverException) as n:
            msg = ("The element must first be present and not stale so that "
                   "it can become stale later.\nError msg was: '%s'" % (n, ))
            raise AssertionError(msg)
    return _this_step


# build the steps that wait for an element to be stale
for condition_string, expected_condition in WAIT_STALE_OPTIONS.iteritems():
    for finder_string, find_by in ELEMENT_FINDERS.iteritems():
        _wait_for_stale_generator(finder_string, find_by,
                                  condition_string, expected_condition)
        name = _construct_name(find_by, condition_string)
        globals()[name] = (_wait_for_stale_generator(finder_string, find_by,
                                                     condition_string,
                                                     expected_condition))


# WAIT FOR AN ALERT
@step(r'wait until (?:I see|there is) an alert(?: within (\d+) seconds)?$')
def wait_for_alert(step, wait_time):
    wait_time = int(wait_time or 10)
    wait = WebDriverWait(world.browser.driver, wait_time)
    try:
        wait.until(EC.alert_is_present())
    except TimeoutException as e:
        msg = ("The alert did not show up within %s seconds. "
               "The error message was: '%s'." % (wait_time, e))
        raise AssertionError(msg)
