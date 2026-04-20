// The platform serves this dev server through an ingress whose Host header
// (e.g. static.<tenant>.haara.dev) doesn't match localhost. Vite blocks
// unknown hosts by default to prevent DNS rebinding; disable that check
// since the ingress is the only way in.
export default {
  server: { allowedHosts: true },
};
