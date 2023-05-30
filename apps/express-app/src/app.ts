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
        message: "Hello New World (metrics version) v3.1.6"
    })
})

app.get('/fib/:index', (req, res) => {
    const n = parseInt(req.params.index);
    if (n < 0 || n > 38) {
        res.status(422).json({
            status: "failed",
            message: "index can not be <0 || >38"
        })
    }
    function fib(n: number): number {
        if (n < 2) return n;
        return fib(n - 1) + fib(n - 2);
    }
    const fib_number = fib(n);
    res.status(200).json({ fib_number });
});

export default app;