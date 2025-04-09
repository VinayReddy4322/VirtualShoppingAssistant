import React from 'react';
import { Users, Package, Settings, Activity } from 'lucide-react';

export function AdminDashboard() {
  return (
    <div className="space-y-6">
      <h1 className="text-3xl font-bold text-gray-900">Admin Dashboard</h1>
      
      <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
        <DashboardCard
          title="Total Users"
          value="1,234"
          icon={<Users className="w-6 h-6" />}
          trend="+12%"
        />
        <DashboardCard
          title="Products"
          value="456"
          icon={<Package className="w-6 h-6" />}
          trend="+5%"
        />
        <DashboardCard
          title="Active Sessions"
          value="89"
          icon={<Activity className="w-6 h-6" />}
          trend="+25%"
        />
        <DashboardCard
          title="System Status"
          value="Healthy"
          icon={<Settings className="w-6 h-6" />}
          trend="Normal"
        />
      </div>

      <div className="mt-8 bg-white rounded-lg shadow">
        <div className="px-6 py-4 border-b border-gray-200">
          <h2 className="text-xl font-semibold text-gray-800">Recent Activity</h2>
        </div>
        <div className="p-6">
          <div className="space-y-4">
            {[
              { action: 'New user registration', time: '5 minutes ago' },
              { action: 'Product inventory updated', time: '1 hour ago' },
              { action: 'System backup completed', time: '3 hours ago' },
              { action: 'New order received', time: '5 hours ago' },
            ].map((item, index) => (
              <div key={index} className="flex justify-between items-center py-2">
                <span className="text-gray-700">{item.action}</span>
                <span className="text-sm text-gray-500">{item.time}</span>
              </div>
            ))}
          </div>
        </div>
      </div>
    </div>
  );
}

function DashboardCard({ title, value, icon, trend }: {
  title: string;
  value: string;
  icon: React.ReactNode;
  trend: string;
}) {
  return (
    <div className="bg-white rounded-lg shadow p-6">
      <div className="flex items-center justify-between">
        <div className="text-gray-500">{title}</div>
        <div className="text-gray-600">{icon}</div>
      </div>
      <div className="mt-4">
        <div className="text-2xl font-semibold text-gray-900">{value}</div>
        <div className="mt-1 text-sm text-green-600">{trend}</div>
      </div>
    </div>
  );
}