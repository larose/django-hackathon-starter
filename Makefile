.DEFAULT_GOAL := run

EXPORT_ENV_VARS :=  set -a && source ./env && set +a
# EXPORT_ENV_VARS := $(shell while read line; do export $$line; done \< <(cat env))
VENV := venv
PYTHON := $(VENV)/bin/python

.PHONY: createsuperuser
createsuperuser:
	$(EXPORT_ENV_VARS) && $(PYTHON) manage.py createsuperuser

.PHONY: create-super-user-if-does-not-exist
create-super-user-if-does-not-exist:
	$(EXPORT_ENV_VARS) && $(PYTHON) manage.py createsuperuserifdoesnotexist

.PHONY: format
format: venv
	$(VENV)/bin/yapf --recursive --in-place app starter

.PHONY: migrate
migrate:
	$(EXPORT_ENV_VARS) && $(PYTHON) manage.py migrate

.PHONY: run
run: venv migrate create-super-user-if-does-not-exist runserver

.PHONY: runserver
runserver:
	$(EXPORT_ENV_VARS) && $(PYTHON) manage.py runserver

.PHONY: venv
venv: $(VENV)/bin/activate
venv/bin/activate: requirements.txt
	test -d $(VENV) || virtualenv $(VENV) -p python3
	$(VENV)/bin/pip install -Ur requirements.txt
	touch $(VENV)/bin/activate
