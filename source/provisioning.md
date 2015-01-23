---
title: Provisioning API

language_tabs:
  - json

toc_footers:
  - <h3>Documentation Index</h3>
  - <a href='/as-api.html#'>Activity Stream API</a>
  - Provisioning API
  - <a href='/graph.html#'>SQL Graph Queries</a>
  - <a href='/analytics.html#'>Analytic Queries</a>
  - <a href='/as-catalog.html#'>The AS Event-Type Catalog</a>
  - <a href='/recipes.html#'>Recipes</a>
  - <a href='/details.html#'>Details & references</a>
  
includes:

search: true
---

# Introduction
This documentation will help you ...

## Service Configuration
Verb | URL | Action
---- | ----------- | -----------
GET  | /api/v1/provisioning/details | Get tenant details


## Users

Verb | URL | Action
---- | ----------- | -----------
GET  | /api/v1/provisioning/users | List Active Users
GET  | /api/v1/provisioning/users/{username} | Get a single user
PUT  | /api/v1/provisioning/users/{username} | Update a single user
DELETE  | /api/v1/provisioning/users/{username} | Revoke all privileges for the user for active tenant
GET | /api/v1/provisioning/users?q=\<info\> | Search for User already with tenant privileges
GET | /api/v1/provisioning/as-users?q=\<info\> | Global Search for AS Users

## Privileges

Verb | URL | Action
---- | ----------- | -----------
GET | /api/v1/provisioning/privileges | List all privileges
GET | /api/v1/provisioning/privileges/{id} | Get a user privilege
PUT | /api/v1/provisioning/privileges/{id} | update user privilege
DELETE | /api/v1/provisioning/privileges/{id} | Revoke user privileges

## Domain Mapping

Verb | URL | Action
---- | ----------- | -----------

## Services

Verb | URL | Action
---- | ----------- | -----------

## Dashboards

Verb | URL | Action
---- | ----------- | -----------

## Statements

Verb | URL | Action
---- | ----------- | -----------

## Endpoints

Verb | URL | Action
---- | ----------- | -----------

## API Keys

Verb | URL | Action
---- | ----------- | -----------


## Global request parameters for search and paging
Field | Description | Example
----- | ----------- | -----------
page | page number starting from 0 | ?page=2
size | number of items per page. Defaults to 20 | ?size=10
q | query string (Functionality varies slightly based on end-point) | ?q=\<some-email\>
