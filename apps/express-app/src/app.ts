import express from 'express'
import promMid from 'express-prometheus-middleware'
const app = express()

app.use(promMid({
    metricsPath: '/metrics',
    collectDefaultMetrics: true,
    requestDurationBuckets: [0.1, 0.5, 1, 1.5],
    requestLengthBuckets: [512, 1024, 5120, 10240, 51200, 102400],
    responseLengthBuckets: [512, 1024, 5120, 10240, 51200, 102400],
}))

app.get('/', (req, res) => {
    res.status(200).json({
        status: "success",
        message: "Hello New World (metrics version) v3.1.3"
    })
})

app.get('/fib/:index', (req, res) => {
    const n = req.params.index;
    function fib(n: number): number {
        if (n < 2) return n;
        return fib(n - 1) + fib(n - 2);
    }
    const fib_number = fib(parseInt(n));
    res.json({ fib_number });
});

export default app;