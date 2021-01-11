# :white_check_mark: htmltest GitHub Action

![Test](https://github.com/wjdp/htmltest-action/workflows/Test/badge.svg)

Run [htmltest](https://github.com/wjdp/htmltest) as part of your GitHub Actions workflow. 

## :computer: Usage

By providing a path

```yaml
- name: Run htmltest
uses: wjdp/htmltest-action@master
with:
  path: dist
```

or by setting a config file

```yaml
- name: Run htmltest
uses: wjdp/htmltest-action@master
with:
  config: .htmltest.yml
```
