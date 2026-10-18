import { describe, expect, it } from '@rstest/core';
import { render, screen } from '@testing-library/react';
import Provider from './index';

describe('Provider', () => {
  it('merender judul kontrak komponen', () => {
    render(<Provider />);
    expect(screen.getByRole('heading', { level: 1 }).textContent).toBe(
      'Hello Module Federation 2.0',
    );
  });

  it('merender logo dengan teks alternatif untuk aksesibilitas', () => {
    render(<Provider />);
    expect(screen.getByRole('img').getAttribute('alt')).toBeTruthy();
  });
});
