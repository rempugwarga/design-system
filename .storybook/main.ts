import type { StorybookConfig } from 'storybook-react-rsbuild';

const config: StorybookConfig = {
  stories: [
    '../stories/**/*.mdx',
    '../stories/**/*.stories.@(js|jsx|mjs|ts|tsx)',
  ],
  framework: {
    name: 'storybook-react-rsbuild',
    options: {},
  },
  addons: [
    {
      name: 'storybook-addon-rslib',
      options: {
        rslib: {
          include: ['**/stories/**'],
        },
      },
    },
    {
      name: '@module-federation/storybook-addon/preset',
      options: {
        remotes: {
          provider: 'designSystem@http://localhost:3001/mf-manifest.json',
        },
      },
    },
  ],
};

export default config;
