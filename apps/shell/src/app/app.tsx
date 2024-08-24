import * as React from 'react';

import NxWelcome from './nx-welcome';

import { Link, Route, Routes } from 'react-router-dom';

// const HomeSpa = React.lazy(() => import('home-spa/Module'));

export function App() {
  return (
    <React.Suspense fallback={null}>
      <ul>
        <li>
          <Link to="/">Home</Link>
        </li>
        <li>
          <Link to="/home-spa">HomeSpaRoutede</Link>
        </li>
      </ul>
      {/* <Routes>
        <Route path="/" element={<NxWelcome title="shell" />} />
        <Route path="/home-spa" element={<HomeSpa />} />
      </Routes> */}
    </React.Suspense>
  );
}

export default App;
