import app from './app.js';
import connectDB from './config/db.js';
import dotenv from 'dotenv';
import logger from './utils/logger';

logger.info('Server started successfully now ');
logger.error('An error occurred during startup');


dotenv.config();

connectDB();

app.listen(3000, () => console.log('Server running on port 3000'));
