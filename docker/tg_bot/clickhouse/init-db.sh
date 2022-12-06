#!/bin/bash
set -e

clickhouse client -n <<-EOSQL
	CREATE DATABASE IF NOT EXISTS todo;
	CREATE TABLE IF NOT EXISTS todo.todo (
		id String,
		text String,
		status String
		) 
	ENGINE = MergeTree() ORDER BY id;
EOSQL