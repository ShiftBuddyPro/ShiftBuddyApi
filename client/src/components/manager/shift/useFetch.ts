import { useState, useEffect } from "react";

export default api => {
  const [error, setError] = useState(null);
  const [loading, setLoading] = useState(true);
  const [data, setData] = useState(null);

  useEffect(() => {
    (async () => {
      setLoading(true);
      try {
        const data = await api;
        console.log(data);
        setData(data);
      } catch (e) {
        setError(e);
      }
      setLoading(false);
    })();
  }, []);
  return { error, loading, data };
};
