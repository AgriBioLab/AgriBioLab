const { test } = require('node:test');
const assert = require('node:assert/strict');
const { validate } = require('./check-traceability.cjs');

const pr = (changes = {}) => ({
  title: 'docs: [SCRUM-86] 개발 이력 연결',
  body: 'Jira: https://tlals0028.atlassian.net/browse/SCRUM-86\nRefs #61',
  head: { ref: 'codex/SCRUM-86-work-traceability' },
  base: { ref: 'dev' },
  ...changes,
});

test('same Jira key in title, branch and canonical link passes', () => {
  assert.deepEqual(validate(pr()).errors, []);
});
test('missing title key fails', () => {
  assert.ok(validate(pr({ title: 'docs: 개발 이력 연결' })).errors.length);
});
test('a different branch key fails', () => {
  assert.ok(validate(pr({ head: { ref: 'feat_SCRUM-49-access' } })).errors.length);
});
test('the team underscore branch prefix is accepted', () => {
  assert.deepEqual(validate(pr({ head: { ref: 'docs_SCRUM-86_teamGuide' } })).errors, []);
});
test('a wrong site or longer key does not satisfy the Jira URL', () => {
  for (const body of ['https://example.com/browse/SCRUM-86', 'https://tlals0028.atlassian.net/browse/SCRUM-860']) {
    assert.ok(validate(pr({ body })).errors.length);
  }
});
test('Markdown link ending in a parenthesis is accepted', () => {
  assert.deepEqual(validate(pr({ body: '[Jira](https://tlals0028.atlassian.net/browse/SCRUM-86)' })).errors, []);
});
test('dev to main release keeps its branch but still requires a Jira URL', () => {
  assert.deepEqual(validate(pr({ head: { ref: 'dev' }, base: { ref: 'main' } })).errors, []);
  assert.ok(validate(pr({ head: { ref: 'dev' }, base: { ref: 'main' }, body: '' })).errors.length);
});
test('missing head or body is reported without crashing', () => {
  assert.ok(validate(pr({ head: null, body: null })).errors.length);
});
