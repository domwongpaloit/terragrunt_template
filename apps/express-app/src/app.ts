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

export default app;