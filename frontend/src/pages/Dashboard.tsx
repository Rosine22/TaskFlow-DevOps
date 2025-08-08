import { useEffect, useState } from 'react';
import { addTask, deleteTask, getTasks } from '../api/api';
import type { Task } from '../types';

export default function Dashboard() {
  const [tasks, setTasks] = useState<Task[]>([]);
  const [title, setTitle] = useState('');
  const [description, setDescription] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');
  const token = localStorage.getItem('token') ?? '';

  const fetchTasks = async () => {
    setLoading(true);
    setError('');
    try {
      const res = await getTasks(token);
      setTasks(res.data);
    } catch (error) {
      console.error('Failed to fetch tasks:', error);
      setError('Failed to fetch tasks.');
    } finally {
      setLoading(false);
    }
  };

  const handleAdd = async () => {
    if (!title.trim() || !description.trim()) {
      setError('Title and description are required');
      return;
    }
    setLoading(true);
    setError('');
    try {
      await addTask({ title: title.trim(), description: description.trim() }, token);
      setTitle('');
      setDescription('');
      await fetchTasks();
    } catch (error) {
      console.error('Failed to add task:', error);
      setError('Failed to add task.');
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (id: number) => {
    setLoading(true);
    setError('');
    try {
      
      await deleteTask(id, token);
      await fetchTasks();
    } catch (error) {
      console.error('Failed to delete task:', error);
      setError('Failed to delete task.');
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    fetchTasks();
  }, []);

  return (
    <div>
      <h2>Dashboard</h2>
      {error && <p style={{ color: 'red' }}>{error}</p>}

      <input
        value={title}
        onChange={(e) => setTitle(e.target.value)}
        placeholder="Task title"
        disabled={loading}
      />
      <input
        value={description}
        onChange={(e) => setDescription(e.target.value)}
        placeholder="Description"
        disabled={loading}
      />
      <button onClick={handleAdd} disabled={loading || !title.trim() || !description.trim()}>
        {loading ? 'Processing...' : 'Add Task'}
      </button>

      {loading && !tasks.length && <p>Loading tasks  ...</p>}

      <ul>
        {tasks.map((task) => (
          <li key={task._id}>
            <b>{task.title}</b>: {task.description}{' '}
            <button onClick={() => handleDelete(task._id)} disabled={loading}>
              Delete
            </button>
          </li>
        ))}
      </ul>
    </div>
  );
}
