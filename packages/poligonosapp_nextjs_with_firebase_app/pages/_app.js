import UserProvider from '../context/userContext'

import { MapContainer, TileLayer, Marker, Popup } from 'react-leaflet'

// Custom App to wrap it with context provider
export default function App({ Component, pageProps }) {
  return (
    <UserProvider>
      <Component {...pageProps} />
    </UserProvider>
  )
}
