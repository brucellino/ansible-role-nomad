[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/brucellino/ansible-role-nomad/main.svg)](https://results.pre-commit.ci/latest/github/brucellino/ansible-role-nomad/main) [![main](https://github.com/brucellino/ansible-role-nomad/actions/workflows/release.yml/badge.svg)](https://github.com/brucellino/ansible-role-nomad/actions/workflows/release.yml)
[![semantic-release: conventional](https://img.shields.io/badge/semantic--release-conventional-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

# Ansible role Nomad

An ansible role for provisioning Nomad on servers and clusters

## Requirements

None.

## Role Variables

See [`defaults`](defaults/main.yml) and [`vars`](vars/main.yml)

## Dependencies

None

## Example Playbook

Full playbook for cluster:

```yaml
- name: Configure servers
  hosts: nomad-servers
  roles:
    - role: ansible-role-nomad

- name: Configure clients
  hosts: nomad-clients
  roles:
    - role: ansible-role-nomad
```

## License

MIT

## Author Information

Bruce Becker @brucellino
