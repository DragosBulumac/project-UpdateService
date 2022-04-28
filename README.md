# Update Service

UpdateService is a simple REST service which allows to manage and packages updates. It provides a set of APIs for:
- Update channels management
- Applications management
- Packages management
- User management

The service is partially compatible with the [updateservicectl](https://github.com/coreos/updateservicectl) client and supports the following command:
- `channel` (`create`, `list`, `update`, `delete`)
- `app` (`create`, `list`, `update`, `delete`)
- `package` (`create`, `list`, `delete`, `upload`, `download`)


## Development 

### Technology Stack

#### Runtime environment
- Docker (https://docs.docker.com/get-started/overview/)
- docker-compose for containers management and orchestration (https://docs.docker.com/compose/)
- Python 3.10

#### Third-party dependency management and build tool
- Poetry - dependency management and packaging tool (https://python-poetry.org/)
- Poe - task runner for poetry (https://github.com/nat-n/poethepoet)

#### Web/API framework
- REST API (https://docs.microsoft.com/uk-ua/azure/architecture/best-practices/api-design)
- FastAPI as API framework (https://fastapi.tiangolo.com/)
- OpenAPI for API documentation (https://swagger.io/specification/). OpenAPI specification will be autogenerated by FastAPI (https://fastapi.tiangolo.com/features/)

#### RDBMS
- Postgres 14
- SQLAlchemy ORM (https://www.sqlalchemy.org/)
- Alembic for schema and data migrations (https://alembic.sqlalchemy.org/en/latest/)

### Testing
- pytest test runner (https://docs.pytest.org/en/6.2.x/)
- `unittest.mock` for test doubles

### Development methodology
We will be using an Agile ([Agile Manifesto](https://agilemanifesto.org/), [Agile Principles](https://agilemanifesto.org/principles)) framework with elements of [Scrum](https://www.scrum.org/resources/what-is-scrum) and [Kanban](https://www.atlassian.com/agile/kanban).

### Ceremonies
| Event                  | When               | Participants    |
|------------------------|--------------------|-----------------|
| Daily scrum (stand-up) | Daily (12 am)      | Team            |
| Demo                   | Every Fri          | Team + PO + PM? |
| Backlog grooming       | Every Thu          | Team + PO       |
| Retrospective          | Every Friday       | Team            |

### Team, responsibility and roles
| Name                 | Email                 | Responsibility     | Scrum Role  |
|----------------------|-----------------------|--------------------|-------------|
| Yuriy Senko          | ysenko@lohika.com     | TeamLead, TechLead | SM, PO      |
| Iryna Klymiv         |                       | PM                 | N/A         |
|                      |                       | Software Eng       | Team Member |

### How to start working on a ticket
Will are using the [Gitlab flow](https://docs.gitlab.com/ee/topics/gitlab_flow.html)

All new features (tickets) must be developed in a separate branch. Use the following branch name template: `<ticket-id>-short-description-of-changes` e.g.: in case if I'm working on issue 34, and I'm going to add `/users` endpoint in scope of this ticket, I'm going to create a branch called `34-users-endpoint`.
After you done all needed changes, push branch to GitLab and create a merge request (MR). All MRs must be pointed to the `main` branch. Assign all your teammates as reviewers. Once you get a TL approve and at least one approve from your peers, proceed with merge.

In order to start development you need:
1. Pick a ticket and assign it to yourself.
2. Make sure that you understand the task and acceptance criteria (never start a task you do not understand, ask TL and PO to clarify it during grooming).
3. Create a feature branch in the format `<ticket-id>-<short-feature-description>` e.g.: `git checkout -b 42-the-ultimate-answer-to-everything`
4. Implement functionality and tests.
5. Run linter and formatter locally and fix all warnings and errors.
6. Run tests and make sure they are passing locally.
7. Make sure commit messages are descriptive.
8. Push your branch to gitlab e.g. `git push origin -u 42-the-ultimate-answer-to-everything`
9. Go to GitLab and create a merge request. Assign, and your teammates as reviewer.
10. Once you get approve from TL and at least one of your peers, feel free to merge the MR, squash commits and delete branch from the GitLab.

### Local dev env

Pre-requisites:
- Python 3.10
- Docker
- docker-compose
- poetry
- Poe

#### Build the app locally
```shell
poetry install
```

#### Run the app locally
```shell
poetry run uvicorn updateservice.app:app --host 0.0.0.0 --port 8080
```
Then open http://127.0.0.1:8080/docs in your browser

#### Run unit tests locally
TBD

#### Run functional tests locally
TBD

#### Create DB migration
TBD

#### Upgrade DB schema
TBD

#### Downgrade DB schema
TBD