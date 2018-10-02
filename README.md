# To-Do List Gem

## Purpose

This gem is created as part of my onboarding process.

## Scope

This gem should be able to:

* add new to-do,
* edit pending to-dos,
* mark to-do as done,
* retrieve detail of a to-do,
* list all to-dos,
* list pending to-dos,
* list finished to-dos,
* delete pending to-dos,
* delete finished to-dos.

A to-do can be either pending or finished. The status is determined by user actions.

A to-do consists of:

* ID (integer, required),
* title (string, required),
* description (string, optional),
* status (enum, required, either `pending` or `finished`).
