module.exports = {
  getGitReferenceFromVersion: 'v-prefix',
  updateVersion: (cwd, version, cb) => { cb(); },

  // Always add the entry to the top of the Changelog, below the header.
  addEntryToChangelog: {
    preset: 'prepend',
    fromLine: 2
  },

  // Only include a commit when there is a footer tag of 'change-type'.
  // Ensures commits which do not up versions are not included.
  includeCommitWhen: (commit) => {
    return !!commit.footer['change-type'];
  },

  // Determine the type from 'change-type:' tag.
  // Should no explicit change type be made, then no changes are assumed.
  getIncrementLevelFromCommit: (commit) => {
    if (commit.footer['change-type']) {
      return commit.footer['change-type'].trim();
    }
  },

  // If a 'changelog-entry' tag is found, use this as the subject rather than the
  // first line of the commit.
  transformTemplateData: (data) => {
    data.commits.forEach((commit) => {
      commit.subject = commit.footer['changelog-entry'] || commit.subject;
    });

    return data;
  },

  template: [
    '## v{{version}} - {{moment date "Y-MM-DD"}}',
    '',
    '{{#each commits}}',
    '* {{capitalize this.subject}}',
    '{{/each}}'
  ].join('\n')
};
