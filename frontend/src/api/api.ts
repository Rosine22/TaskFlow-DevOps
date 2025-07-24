import axios from 'axios';

const API = axios.create({
  baseURL: 'http://localhost:3000/api',
});

export const register = (data: any) => API.post('/auth/register', data);
export const login = (data: any) => API.post('/auth/login', data);
export const getTasks = (token: string) =>
  API.get('/tasks', { headers: { Authorization: `Bearer ${token}` } });
export const addTask = (task: any, token: string) =>
  API.post('/tasks', task, { headers: { Authorization: `Bearer ${token}` } });
export const updateTask = (id: number, task: any, token: string) =>
  API.put(`/tasks/${id}`, task, { headers: { Authorization: `Bearer ${token}` } });
export const deleteTask = (id: number, token: string) =>
  API.delete(`/tasks/${id}`, { headers: { Authorization: `Bearer ${token}` } });
