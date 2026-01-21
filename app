import React, { useState } from 'react';
import Sidebar from './components/Sidebar';
import AnalysisView from './components/AnalysisView';
import PatientRecordsView from './components/PatientRecordsView';
import DoctorsDirectoryView from './components/DoctorsDirectoryView';
import LoginView from './components/LoginView';
import { View, PatientDraft } from './types';

const App: React.FC = () => {
  const [user, setUser] = useState<{ name: string; email: string } | null>(null);
  const [currentView, setCurrentView] = useState<View>(View.Analysis);
  const [language, setLanguage] = useState<'en' | 'hi' | 'te' | 'ta'>('en');
  const [drafts, setDrafts] = useState<PatientDraft[]>([]);

  const handleLogin = (name: string, email: string) => {
    setUser({ name, email });
  };

  const handleLogout = () => {
    setUser(null);
    setCurrentView(View.Analysis);
  };

  const addDraft = (draft: PatientDraft) => {
    setDrafts(prev => [draft, ...prev]);
  };

  if (!user) {
    return <LoginView onLogin={handleLogin} />;
  }

  const renderView = () => {
    switch (currentView) {
      case View.Analysis:
        return <AnalysisView addDraft={addDraft} language={language} patientUser={user} />;
      case View.PatientDrafts:
        return <PatientRecordsView drafts={drafts} />;
      case View.DoctorsDirectory:
        return <DoctorsDirectoryView />;
      default:
        return <AnalysisView addDraft={addDraft} language={language} patientUser={user} />;
    }
  };

  return (
    <div className="flex h-screen bg-gray-100 font-sans">
      <Sidebar
        currentView={currentView}
        setCurrentView={setCurrentView}
        onLogout={handleLogout}
        user={user}
        language={language}
        setLanguage={setLanguage}
      />
      <main className="flex-1 overflow-y-auto p-4 sm:p-6 md:p-8">
        {renderView()}
      </main>
    </div>
  );
};

export default App;
